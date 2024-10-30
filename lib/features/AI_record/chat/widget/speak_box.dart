import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:audio_session/audio_session.dart' as audio_session;
import 'package:audioplayers/audioplayers.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:memoirverse/components/custom_textfield.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:memoirverse/utils/speech_to_text.dart';
import 'package:memoirverse/utils/text_to_speech.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sound_stream/sound_stream.dart';
import 'package:web_socket_channel/io.dart';

class SpeakBoxWidget extends StatefulWidget {
  const SpeakBoxWidget({Key? key}) : super(key: key);

  @override
  _SpeakBoxState createState() => _SpeakBoxState();
}

class _SpeakBoxState extends State {
  // final FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();

  FocusNode _focusText = FocusNode();
  //SpeechToText? speechToText;
  //TextToSpeech? textToSpeech;
  final RecorderStream _recorder = RecorderStream();

  late StreamSubscription _recorderStatus;
  late StreamSubscription _audioStream;

  /// 是否在说话
  bool isTalking = false;
  bool isKeyboard = false;
  final speakTextController = TextEditingController();
  int state = 0;

  @override
  void initState() {
    super.initState();
    _startRecord();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_recorderStatus != null) _recorderStatus.cancel();
    if (_audioStream != null) _audioStream.cancel();
    //speechToText?.close();

    super.dispose();
  }

  Future<void> _initStream() async {
    SpeechToText speechToText = SpeechToText(onTextResult: (text) {
      if (text == "error") {
        state = 2;
        setState(() {
          isTalking = false;
        });
        _stopRecord();
        return;
      }
      print(text);

      setState(() {
        speakTextController.text = text;
      });
    });
    speechToText.connect();
    _audioStream = _recorder.audioStream.listen((data) {
      if (state == 0) {
        speechToText.sendVoice(Uint8List(0), state: 0);
        state = 1;
        speechToText.sendVoice(data, state: 1);
      } else if (state == 1) {
        speechToText.sendVoice(data, state: 1);
      } else if (state == 2) {
        speechToText.sendVoice(data, state: 2);
        state = -1;
        speechToText.close();
      }
      //data.clear();
    });

    _recorderStatus = _recorder.status.listen((status) {
      if (mounted) {
        setState(() {});
      }
    });

    await Future.wait([
      _recorder.initialize(),
    ]);
  }

  void _startRecord() async {
    state = 0;
    setState(() {
      isTalking = true;
    });
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }

    _initStream();

    await _recorder.start();

    setState(() {});
  }

  void _stopRecord() async {
    state = 2;
    setState(() {
      isTalking = false;
    });
    await _recorder.stop();

    setState(() {});
  }

  // /// 初始化录音
  // Future<void> initRecorder() async {
  //   var status = await Permission.microphone.request();
  //   if (status != PermissionStatus.granted) {
  //     throw RecordingPermissionException('Microphone permission not granted');
  //   }
  //   await _mRecorder.openRecorder();

  //   // 设置音频音量获取频率
  //   _mRecorder.setSubscriptionDuration(
  //     const Duration(milliseconds: 100),
  //   );
  //   _mRecorder.onProgress!.listen((event) {
  //     // 0 - 120

  //   });

  //   final session = await audio_session.AudioSession.instance;
  //   await session.configure(audio_session.AudioSessionConfiguration(
  //     avAudioSessionCategory:
  //         audio_session.AVAudioSessionCategory.playAndRecord,
  //     avAudioSessionCategoryOptions:
  //         audio_session.AVAudioSessionCategoryOptions.allowBluetooth |
  //             audio_session.AVAudioSessionCategoryOptions.defaultToSpeaker,
  //     avAudioSessionMode: audio_session.AVAudioSessionMode.spokenAudio,
  //     avAudioSessionRouteSharingPolicy:
  //         audio_session.AVAudioSessionRouteSharingPolicy.defaultPolicy,
  //     avAudioSessionSetActiveOptions:
  //         audio_session.AVAudioSessionSetActiveOptions.none,
  //     androidAudioAttributes: const audio_session.AndroidAudioAttributes(
  //       contentType: audio_session.AndroidAudioContentType.speech,
  //       flags: audio_session.AndroidAudioFlags.none,
  //       usage: audio_session.AndroidAudioUsage.voiceCommunication,
  //     ),
  //     androidAudioFocusGainType: audio_session.AndroidAudioFocusGainType.gain,
  //     androidWillPauseWhenDucked: true,
  //   ));
  // }

  // StreamSubscription? _mRecordingDataSubscription;
  // Future<void> stopRecorder() async {
  //   await _mRecorder.stopRecorder();
  //   if (_mRecordingDataSubscription != null) {
  //     await _mRecordingDataSubscription!.cancel();
  //     _mRecordingDataSubscription = null;
  //   }
  // }

  /// 0 :第一帧音频
  /// 1 :中间的音频
  /// 2 :最后一帧音频

  // Future<void> startRecord() async {
  //   var recordingDataController = StreamController<Uint8List>();
  //   _mRecordingDataSubscription =
  //       recordingDataController.stream.listen((Uint8List buffer) {
  //     if (state == 0) {
  //       speechToText?.sendVoice(Uint8List(0), state: 0);
  //       state = 1;
  //       speechToText?.sendVoice(buffer, state: 1);
  //     } else if (state == 1) {
  //       speechToText?.sendVoice(buffer, state: 1);
  //     } else if (state == 2) {
  //       speechToText?.sendVoice(buffer, state: 2);
  //       state = -1;
  //     }
  //   });
  // await _mRecorder.startRecorder(
  //   // toFile: "filePath",
  //   toStream: recordingDataController.sink,
  //   codec: Codec.pcm16,
  //   numChannels: 1,
  //   sampleRate: 16000,
  // );
  //}

  // void startSpeak() {
  //   speechToText = SpeechToText.connectVoice(onTextResult: (text) {
  //     if (text == "error") {
  //       state = 2;
  //       setState(() {
  //         isTalking = false;
  //       });
  //       stopRecorder();
  //       return;
  //     }
  //     print(text);

  //     setState(() {
  //       // this.speak_text += text;
  //     });
  //   });
  //   startRecord();
  // }

  void speakQuestion(String question) {
    TextToSpeech textToSpeech = TextToSpeech();
    textToSpeech.sendTextHttp(question);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 390.w,
        height: 475.h,
        decoration: ShapeDecoration(
          color: Color(0x0FFFFFF4),
          shape: RoundedRectangleBorder(
            //side: BorderSide(width: 1, color: Color(0x7FC8C7AC)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(children: [
          SizedBox(height: 17.h),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  speakTextController.text = "";
                });
              },
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 0.h, bottom: 10.h),
                      child: Text(
                        '清空',
                        style: TextStyle(
                          color: Color(0xFF828282),
                          fontSize: 22.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          letterSpacing: -0.41,
                        ),
                      )))),
          SizedBox(height: 10.h),
          Expanded(
              child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 22.0.w, right: 18.w),
                  child: Stack(children: [
                    Container(
                        //width: 318.w,
                        // decoration: ShapeDecoration(
                        //   color: Color(0x26919AB4),
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        // ),
                        child: Center(
                            child: CustomTextField(
                      controller: speakTextController,
                      hintText: "",
                      //prefixIcon: Icons.person_outline,
                      background_color: Colors.transparent,
                      inputType: TextInputType.multiline,
                      autofocus: false,
                      focusNode: _focusText,
                    )))
                  ]))),
          Padding(
              padding: EdgeInsets.fromLTRB(25.w, 10.h, 38.w, 10.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () async {
                          FocusScope.of(context).requestFocus(_focusText);
                          // setState(() {
                          //   isKeyboard = !isKeyboard;
                          // });
                          // if (isKeyboard)
                          //   FocusScope.of(context).requestFocus(_focusText);
                          // else
                          //   _focusText.unfocus();
                        },
                        child: Container(
                          width: 44.w,
                          height: 44.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/keyboard.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (isTalking) {
                          _stopRecord();
                        } else {
                          _startRecord();
                        }
                      },
                      child: AvatarGlow(
                        startDelay: const Duration(milliseconds: 1000),
                        glowColor: Colors.red,
                        glowShape: BoxShape.circle,
                        animate: isTalking,
                        child: Material(
                            // Replace this child with your own
                            color: Color(0xFFFFFFF4),
                            elevation: 0.0,
                            shape: const CircleBorder(),
                            child: Container(
                              width: 82.w,
                              height: 82.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(isTalking
                                      ? "assets/images/stop.png"
                                      : "assets/images/play.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                      ),
                    ),
                    GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          String answer;

                          answer = speakTextController.text;

                          if (answer.isEmpty) return;
                          sendAnswerToAI(context, answer);
                          speakTextController.text = "";
                        },
                        child: Container(
                          width: 36.w,
                          height: 36.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/send.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ))
                  ])),
          SizedBox(height: 21.h)
        ]));
  }

  sendAnswerToAI(BuildContext context, String answer) {
    context
        .read<ChatGPTPromptService>()
        .sendInterviewPrompt(prompt: answer, onQuestion: speakQuestion);
    Navigator.pop(context);
  }
}
