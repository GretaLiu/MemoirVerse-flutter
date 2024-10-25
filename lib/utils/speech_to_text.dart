// ignore_for_file: non_constant_identifier_names, constant_identifier_names, curly_braces_in_flow_control_structures, unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:memoirverse/global/app_constants.dart';

import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class SpeechToText {
  /// 配置参数

  static const String _host =
      "wss://openspeech.bytedance.com/api/v3/sauc/bigmodel";

  static const int PROTOCOL_VERSION = 1;
  int header_size = 1;
  String reqId = "";
  //Message Type:
  static const int FULL_CLIENT_REQUEST = 1;
  static const int AUDIO_ONLY_REQUEST = 2;
  static const int FULL_SERVER_RESPONSE = 9;
  static const int SERVER_ACK = 11;
  static const int SERVER_ERROR_RESPONSE = 15;
  // Message Type Specific Flags
  static const int NO_SEQUENCE = 0; // no check sequence
  static const int POS_SEQUENCE = 1;
  static const int NEG_SEQUENCE = 2;
  static const int LAST_AUDIO_PACKAGE = 1;
  static const int NEG_WITH_SEQUENCE = 3;
  static const int NEG_SEQUENCE_1 = 3;
  //Message Serialization
  static const int NO_SERIALIZATION = 0;
  static const int JSON = 1;

  // Message Compression
  static const int NO_COMPRESSION = 0;
  static const int GZIP = 1;

  IOWebSocketChannel? _channel;

  ValueChanged<String>? onTextResult;

  /// 创建连接 发送语音
  /// listen 转化完成后的回调
  SpeechToText({this.onTextResult}) {}

  connect() {
    Map<String, dynamic> header = {};

    header["X-Api-Resource-Id"] = "volc.bigasr.sauc.duration";
    header["X-Api-Access-Key"] =
        AppConstants.volcengine_speechToText_apiAccessToken;
    header["X-Api-App-Key"] = AppConstants.volcengine_speechToText_appId;
    header["X-Api-Request-Id"] = Uuid().v4();
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
    //_channel?.sink.close(status);
  }

  Uint8List generate_header(
      {int message_type = FULL_CLIENT_REQUEST,
      int message_type_specific_flags = NO_SEQUENCE,
      int serial_method = JSON,
      int compression_type = NO_COMPRESSION,
      int reserved_data = 0x00}) {
    /*
    protocol_version(4 bits), header_size(4 bits),
    message_type(4 bits), message_type_specific_flags(4 bits)
    serialization_method(4 bits) message_compression(4 bits)
    reserved （8bits) 保留字段
    */

    Uint8List header = Uint8List(4);
    header[0] = ((PROTOCOL_VERSION << 4) | 1);
    header[1] = ((message_type << 4) | message_type_specific_flags);
    header[2] = ((serial_method << 4) | compression_type);
    header[3] = (reserved_data);
    return header;
  }

  Uint8List construct_request() {
    var req = {
      "user": {
        "uid": reqId,
      },
      "audio": {
        'format': "pcm",
        "sample_rate": 16000,
        "bits": 16,
        "channel": 1,
        "language": "zh-CN"
      },
      "request": {
        "model_name": "bigmodel",
      }
    };
    String jsonString = jsonEncode(req);

    List<int> list = jsonString.codeUnits;

    Uint8List bytes = Uint8List.fromList(list);
    return bytes;
  }

  Uint8List build_request(int state, Uint8List audio_payload) {
    Uint8List header;
    Uint8List payload;
    if (state == 0) {
      header = generate_header();
      payload = construct_request();
    } else if (state == 1) {
      header = generate_header(
          message_type: AUDIO_ONLY_REQUEST, serial_method: NO_SERIALIZATION);
      payload = audio_payload;
    } else {
      header = generate_header(
          message_type: AUDIO_ONLY_REQUEST,
          message_type_specific_flags: NEG_SEQUENCE,
          serial_method: NO_SERIALIZATION);
      payload = audio_payload;
    }

    //List<int> payload_gzip = GZipCodec().encode(payload);
    //int payload_size = payload_gzip.length;
    ByteData byteData = ByteData(4);
    byteData.setUint32(0, payload.length, Endian.big);
    Uint8List payload_size_bytes = byteData.buffer.asUint8List();
    final bytesBuilder = BytesBuilder();
    bytesBuilder.add(header);
    bytesBuilder.add(payload_size_bytes);
    bytesBuilder.add(payload);
    return bytesBuilder.toBytes();
  }

  void _onMessage(dynamic data) {
    try {
      //debugPrint("result = $data");

      Uint8List res = data;
      int protocol_version = res[0] >> 4;
      int header_size = res[0] & 0x0f;
      int message_type = res[1] >> 4;
      int message_type_specific_flags = res[1] & 0x0f;
      int serialization_method = res[2] >> 4;
      int message_compression = res[2] & 0x0f;
      int reserved = res[3];
      //int header_extensions = res[4:header_size * 4];
      Uint8List payload = res.sublist(header_size * 4);
      Uint8List? payload_msg;
      List<int>? payload_msg_int;
      int payload_size = 0;
      if (message_type_specific_flags & 0x01 != 0) {
        // receive frame with sequence

        ByteData byteData = ByteData.sublistView(payload.sublist(0, 4));
        int seq = byteData.getUint32(0, Endian.big);

        payload = payload.sublist(4);

        String string = String.fromCharCodes(payload);
        print(string);
      }

      if (message_type_specific_flags & 0x02 != 0) {
        //receive last package
        //result['is_last_package'] = True
        //last package
      }
      if (message_type == FULL_SERVER_RESPONSE) {
        ByteData byteData = ByteData.sublistView(payload.sublist(0, 4));
        payload_size = byteData.getUint32(0, Endian.big);
        payload_msg = payload.sublist(4);
      }
      if (message_type == SERVER_ERROR_RESPONSE) {
        // ByteData byteData = ByteData.sublistView(payload.sublist(0, 4));
        // payload_size = byteData.getUint32(0, Endian.big);
        // payload_msg = payload.sublist(4);
        // String string = String.fromCharCodes(payload);
        // print(string);
        onTextResult?.call("error");
        return;
      }

      if (serialization_method == JSON) {
        String payload_str = "";
        if (message_compression == GZIP) {
          payload_msg_int = GZipCodec().decode(payload_msg!);
          payload_str = Utf8Codec().decode(payload_msg!);
        } else {
          //String payload_str_gzip = Utf8Codec().decode(payload_msg_int!);
          payload_str = Utf8Codec().decode(payload_msg!);
          print(payload_str);
          final json = jsonDecode(payload_str);
          final result = json["result"];
          if (result != null) {
            final text = result["text"];
            if (text != null) {
              onTextResult?.call(text);
            }
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void sendVoice(Uint8List voice, {int state = 0}) {
    Uint8List req = build_request(state, voice);

    _channel?.sink.add(req);
  }
}
