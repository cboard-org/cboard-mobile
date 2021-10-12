import 'dart:io';

import 'package:cboard_mobile/data/data.dart';
import 'package:cboard_mobile/shared/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceRecorder extends StatefulWidget {
  final bool tileRecord;
  final Tile tile;

  VoiceRecorder({Key key, this.tileRecord = false, this.tile}) : super(key: key);
  @override
  _VoiceRecorderState createState() => _VoiceRecorderState();
}

const theSource = AudioSource.microphone;
typedef _fn = void Function();
typedef void OnError(Exception exception);

class _VoiceRecorderState extends State<VoiceRecorder> {
  FlutterSoundPlayer _mPlayer = FlutterSoundPlayer(logLevel: Level.debug);
  FlutterSoundRecorder _mRecorder = FlutterSoundRecorder(logLevel: Level.debug);
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;
  Duration _duration = new Duration();
  Duration _position = new Duration();

  String _mPath = 'flutter_sound_example.aac';

  bool isRecord = false;

  @override
  void initState() {
    isRecord = widget.tileRecord;
    _mPlayer.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

    openTheRecorder().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
      print(_mRecorderIsInited);
    });

    _mPlayer.setSubscriptionDuration(Duration(milliseconds: 1));

    super.initState();
  }

  @override
  void dispose() {
    _mPlayer.closeAudioSession();
    _mPlayer = null;

    _mRecorder.closeAudioSession();
    _mRecorder = null;
    super.dispose();
  }

  // Future<String> _getTempPath(String path) async {
  //   var tempDir = await getTemporaryDirectory();
  //   return tempDir.path + "/cboard/" + path;
  // }

  Future<String> _getDownloadPath(String path) async {
    final directory = await getApplicationDocumentsDirectory();
    Directory cboardDirectory = Directory(directory.path+"/cboard");
    print(await cboardDirectory.exists());
    await cboardDirectory.create();
    return cboardDirectory.path + '/'+path;
  }

  Future<File> downloadFile(String path) async {
    // File sourceFile = File(_mPath);
    String _downloadPath = await _getDownloadPath(widget.tile.name+".mp3");
    FlutterSoundHelper().convertFile(_mPath, Codec.aacADTS, _downloadPath, Codec.mp3);
    // final newFile = await sourceFile.copy(_downloadPath);
    // await sourceFile.delete();
    return File(_downloadPath);
  }

  Future<void> openTheRecorder() async {
    // _mPath = await _getTempPath(widget.tile.name);
    // _mPathMP3 = await _getTempPath('flutter_sound_example.mp3');

    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await _mRecorder.openAudioSession();
    _mRecorderIsInited = true;
  }

  void record() {
    _mRecorder
        .startRecorder(
      toFile: _mPath,
      audioSource: theSource,
    )
        .then((value) {
      setState(() {});
    });
  }

  void stopRecorder() async {
    await _mRecorder.stopRecorder().then((value) {
      setState(() {
        //var url = value;
        _mplaybackReady = true;
      });
    });
  }

  _fn getRecorderFn() {
    if (!_mRecorderIsInited || !_mPlayer.isStopped) {
      return null;
    }
    return _mRecorder.isStopped ? record : stopRecorder;
  }

  _fn getPlaybackFn() {
    if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder.isStopped) {
      return null;
    }
    return _mPlayer.isPlaying ? pausePlayer : _mPlayer.isPaused ? resumePlayer : play;
    // return _mPlayer.isStopped ? play : stopPlayer;
  }

  void play() {
    assert(_mPlayerIsInited &&
        _mplaybackReady &&
        _mRecorder.isStopped &&
        _mPlayer.isStopped);
    _mPlayer
        .startPlayer(
            fromURI: _mPath,
            //codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,
            whenFinished: () {
              setState(() {});
            })
        .then((value) {
      setState(() {});
      _mPlayer.dispositionStream().listen((event) {
        print("Event's duration" + event.duration.toString());
        setState(() {
          _position = event.position;
          _duration = event.duration;
        });
      });
    });

  }

  void pausePlayer() {
    print("Pausing");
    _mPlayer.pausePlayer().then((value) {
      setState(() {});
    });
  }

  void resumePlayer() {
    print("resuming");
    _mPlayer.resumePlayer().then((value) {
      setState(() {});
    });
  }

  void stopPlayer() {
    print("Stopping");
    _mPlayer.stopPlayer().then((value) {
      setState(() {});
    });
  }
  Widget slider() {
    return Slider(
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        inactiveColor: grey,
        activeColor: Theme.of(context).primaryColor,
        onChanged: (double value) {
          setState(() {
            _mPlayer.seekToPlayer(Duration(seconds: value.toInt()));
            value = value;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height) / 15,
        child: BaseAppBar(
          leading: GestureDetector(
            onTap: () => {Navigator.pop(context)},
            child: Icon(Icons.arrow_back, color: Colors.white, size: 25.0),
          ),
          title: Text('Voice Recorder'),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            // Tile Name
            title: Text('Voice Recorder'),
            subtitle: Text("Have a customized voice recording for this tile"),
            trailing: Wrap(
              children: [
                Switch(
                  value: isRecord,
                  onChanged: (value) {
                    setState(() {
                      isRecord = value;
                    });
                  },
                  activeTrackColor: paua,
                  activeColor: Colors.white,
                ),
              ],
            ),
          ),
            SizedBox(
              height: 200,
            ),
            Visibility(
              visible: isRecord,
                child: (_mPlayerIsInited && _mplaybackReady)
                    ? Column(
                  children: [
                    slider(),
                    IconButton(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        iconSize: 50,
                        onPressed: getPlaybackFn(),
                        icon: _mPlayer.isPlaying
                            ? Icon(Icons.pause_circle_filled_outlined)
                            : Icon(Icons.play_circle_fill_outlined)),
                    TextButton(
                      onPressed: (){
                        setState(() {
                          _mplaybackReady = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete,color: red_stop,),
                          Text('Rerecord',style: TextStyle(color: red_stop),)
                        ],
                      ),
                    ),
                    Button(
                      label: Text("Download"),
                      isPrimary: true,
                      onPress: (){
                          downloadFile(widget.tile.name).then((value) => {
                            if(value!=null)
                              print("downloaded"+value.path)
                            else
                              print("Couldn't download")
                          });
                      },
                    )
                  ],
                )
                    : IconButton(
                    onPressed: getRecorderFn(),
                    color: Theme
                        .of(context)
                        .primaryColor,
                    iconSize: 40,
                    icon: _mRecorder.isRecording
                        ? Icon(Icons.stop_circle_outlined, color: red_stop,size: 40,)
                        : Icon(Icons.mic))
            ),

        ],
      ),
    );
  }
}
