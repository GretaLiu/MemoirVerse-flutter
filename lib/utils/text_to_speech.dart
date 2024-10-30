// ignore_for_file: non_constant_identifier_names, constant_identifier_names, curly_braces_in_flow_control_structures, unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:memoirverse/global/app_constants.dart';
import 'package:memoirverse/global/global.dart';

import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class TextToSpeech {
  /// 配置参数
  /// appid = "xxx"

  static const String cluster = "volcano_tts";

  static const String _host =
      "wss://openspeech.bytedance.com/api/v1/tts/ws_binary";

// # version: b0001 (4 bits)
// # header size: b0001 (4 bits)
// # message type: b0001 (Full client request) (4bits)
// # message type specific flags: b0000 (none) (4bits)
// # message serialization method: b0001 (JSON) (4 bits)
// # message compression: b0001 (gzip) (4bits)
// # reserved data: 0x00 (1 byte)
  Uint8List default_header = Uint8List.fromList([0x11, 0x10, 0x10, 0x00]);

  List voice_type = [
    "zh_female_tianmeixiaoyuan_moon_bigtts", //甜美女生 甜美小源
    "ICL_zh_female_linjuayi_tob", //  播音女生 邻居阿姨
    "zh_female_tianmeiyueyue_moon_bigtts", //  童音女生 甜美悦悦
    "zh_male_jieshuoxiaoming_moon_bigtts", //  播音男生 解说小明
    "zh_male_linjiananhai_moon_bigtts", //  童音男生 邻家男孩
  ];

  IOWebSocketChannel? _channel;

  ValueChanged<Uint8List>? onResult;
  TextToSpeech() {}

  TextToSpeech.connect({this.onResult}) {
    Map<String, dynamic> header = {};

    header["Authorization"] =
        AppConstants.volcengine_textToSpeech_apiAccessToken;

    _channel = IOWebSocketChannel.connect(_host, headers: header);
    //创建监听
    _channel?.stream.listen((message) {
      _onMessage(message);
    }, onError: (e) {
      debugPrint(" init error $e");
    });
  }

  ///关闭连接
  close([int status = status.goingAway]) {
    debugPrint('关闭连接');
    _channel?.sink.close(status);
  }

  Uint8List build_request(int voice_type_index, int speed_ratio, String text) {
    String uuid = Uuid().v4();
    var request_json = {
      "app": {
        "appid": AppConstants.volcengine_textToSpeech_appId,
        "token": "access_token",
        "cluster": cluster
      },
      "user": {"uid": "388808087185088"},
      "audio": {
        "voice_type": voice_type[voice_type_index],
        "encoding": "mp3",
        "speed_ratio": speed_ratio,
        "volume_ratio": 1.0,
        "pitch_ratio": 1.0,
      },
      "request": {
        "reqid": uuid,
        "text": text,
        "text_type": "plain",
        "operation": "submit"
      }
    };
    String jsonString = jsonEncode(request_json);
    List<int> list = jsonString.codeUnits;

    Uint8List payload_bytes = Uint8List.fromList(list);
    List<int> payload_bytes_gzip = GZipCodec().encode(payload_bytes);
    ByteData byteData = ByteData(4);
    byteData.setUint32(0, payload_bytes_gzip.length, Endian.big);
    Uint8List payload_size = byteData.buffer.asUint8List();
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(default_header);
    bytesBuilder.add(payload_size);
    bytesBuilder.add(payload_bytes_gzip);
    return bytesBuilder.toBytes();
  }

  void _onMessage(dynamic res) {
    debugPrint("result = $res");
    int protocol_version = res[0] >> 4;
    int header_size = res[0] & 0x0f;
    int message_type = res[1] >> 4;
    int message_type_specific_flags = res[1] & 0x0f;
    int serialization_method = res[2] >> 4;
    int message_compression = res[2] & 0x0f;
    int reserved = res[3];
    //int header_extensions = res[4:header_size*4]
    Uint8List payload = res.subList(header_size * 4);
    if (message_type == 0xb) {
      //# audio-only server response
      if (message_type_specific_flags == 0) {
        // # no sequence number as ACK
        print("Payload size: 0");
        return;
      } else {
        ByteData byteData_seq = ByteData.sublistView(payload.sublist(0, 4));
        int sequence_number = byteData_seq.getUint32(0, Endian.big);
        ByteData byteData_size = ByteData.sublistView(payload.sublist(4, 8));
        int payload_size = byteData_size.getUint32(0, Endian.big);

        payload = payload.sublist(8);
        if (sequence_number < 0) {
        } else {}
      }
    } else if (message_type == 0xf) {
      //error
    } else if (message_type == 0xc) {
      ByteData byteData_size = ByteData.sublistView(payload.sublist(0, 4));
      int msg_size = byteData_size.getUint32(0, Endian.big);

      payload = payload.sublist(4);
      if (message_compression == 1) {
        List<int> payload_int = GZipCodec().decode(payload);
      }
    } else {}
  }

  // void sendText(int voice_type_index, int speed_ratio, String text) {
  //   Uint8List req = build_request(voice_type_index, speed_ratio, text);
  //   _channel?.sink.add(req);
  // }

  sendTextHttp(String text) async {
    final Dio _dio = Dio();
    try {
      String uuid = Uuid().v4();
      var response =
          await _dio.post('https://openspeech.bytedance.com/api/v1/tts',
              options: Options(
                headers: {
                  HttpHeaders.contentTypeHeader: "application/json",
                  HttpHeaders.authorizationHeader:
                      "Bearer;${AppConstants.volcengine_textToSpeech_apiAccessToken}",
                },
              ),
              data: {
            "app": {
              "appid": AppConstants.volcengine_textToSpeech_appId,
              "token": "access_token",
              "cluster": cluster
            },
            "user": {"uid": "388808087185088"},
            "audio": {
              "voice_type": voice_type[Global.voice_type_index],
              "encoding": "mp3",
              "speed_ratio": Global.speaking_speed.toInt(),
              "volume_ratio": Global.speaking_speed,
              "pitch_ratio": 1.0,
            },
            "request": {
              "reqid": uuid,
              "text": text,
              "text_type": "plain",
              "operation": "query",
              "with_frontend": 1,
              "frontend_type": "unitTson"
            },
          });
      if (response.statusCode == 200) {
        print(response.data);
        var decodeBytes = base64.decode(response.data['data']);
        final player = AudioPlayer();
        await player.play(BytesSource(decodeBytes));
      }
    } on DioException catch (err) {
      print(err);
    }
  }
}
