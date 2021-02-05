import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aliplayer/flutter_aliplayer.dart';
import 'package:flutter_aliplayer/flutter_aliplayer_factory.dart';
import 'package:nft_flutter_module/component/video_control/videoControl.dart';
import 'package:nft_flutter_module/page/video_page.dart';
import 'package:nft_flutter_module/config.dart';

void main() => runApp(Home());


class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'bshbd',
      home: Scaffold(
        // body: VideoGridPage(playMode: ModeType.STS),
        // body: PlayerPage(),
        body: VideoWrap(),
      ),
    );
  }

}

class VideoWrap extends StatelessWidget{

  handlePause(){
    print("handle pause");
  }

  handlePlay(){
    print("handle play");
  }

  handleToggle(){
    print("handle toggle");
  }

  handleSeekTo(){
    print("handle seekto");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return videoControl(
      duration: 100,
      curTime: 20,
      isPlaying: false,
      show: true,
      pause: handlePause(),
      play: handlePlay(),
      seekTo: handleSeekTo(),
      togglePlay: handleToggle(),
    );
  }

}

class PlayerPage extends StatefulWidget {

  PlayerPage({Key key})
      : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> with WidgetsBindingObserver {
  FlutterAliplayer fAliplayer;
  // ModeType _playMode;
  // Map<String, dynamic> _dataSourceMap;

  @override
  void initState() {
    super.initState();
    //创建播放器
    // debugger(when: true);
    fAliplayer = FlutterAliPlayerFactory().createAliPlayer();
    _initListener();
    fAliplayer.setUrl("https://alivc-demo-vod.aliyuncs.com/6b357371ef3c45f4a06e2536fd534380/53733986bce75cfc367d7554a47638c0-fd.mp4");
    fAliplayer.prepare();
    fAliplayer.play();
  }

  ///设置监听
  _initListener() {
    // fAliplayer.setOnPrepard(() {});
    print("playerListener:init");
    fAliplayer.setOnPrepared(() {
      print("playerListener:OnPrepared");
    });
    fAliplayer.setOnRenderingStart(() {
      print("playerListener:OnRenderingStart");
    });
    fAliplayer.setOnVideoSizeChanged((width, height) {
      print("playerListener:OnRenderingStart");
    });
    fAliplayer.setOnStateChanged((newState) {
      print("playerListener:OnStateChanged:"+newState.toString());
    });
    fAliplayer.setOnLoadingStatusListener(
        loadingBegin: () {
          print("playerListener:OnLoadingStatusListener:loadingBegin");
        },
        loadingProgress: (percent, netSpeed) {
          print("playerListener:OnLoadingStatusListener:loadingProgress:"+percent.toString()+":"+netSpeed.toString());
        },
        loadingEnd: () {
          print("playerListener:OnLoadingStatusListener:loadingEnd");
        });
    fAliplayer.setOnSeekComplete(() {
      print("playerListener:OnSeekComplete");
    });
    fAliplayer.setOnInfo((infoCode, extraValue, extraMsg) {
      print("playerListener:OnInfo:"+infoCode.toString()+":"+extraValue.toString()+":"+extraMsg.toString());
    });
    fAliplayer.setOnCompletion(() {
      print("playerListener:OnCompletion");
    });
    fAliplayer.setOnTrackReady(() {
      print("playerListener:OnRenderingStart");
    });
    fAliplayer.setOnSnapShot((path) {
      print("playerListener:OnTrackReady");
    });
    fAliplayer.setOnError((errorCode, errorExtra, errorMsg) {
      print("playerListener:OnError:"+errorCode.toString()+":"+errorExtra.toString()+":"+errorMsg.toString());
    });
    fAliplayer.setOnTrackChanged((value) {
      print("playerListener:OnTrackChanged:"+value);
    });
    fAliplayer.setOnThumbnailPreparedListener(
        preparedSuccess: () {
          print("playerListener:OnThumbnailPreparedListener:preparedSuccess");
        }, preparedFail: () {
      print("playerListener:OnThumbnailPreparedListener:preparedFail");
    });
    print("playerListener:init:after");
  }

  @override
  void dispose() {
    fAliplayer.stop();
    fAliplayer.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var x = 0.0;
    var y = 0.0;
    Orientation orientation = MediaQuery.of(context).orientation;
    var width = MediaQuery.of(context).size.width;

    var height;
    if (orientation == Orientation.portrait) {
      height = width * 9.0 / 16.0;
    } else {
      height = MediaQuery.of(context).size.height;
    }
    // debugger(when: true);
    AliPlayerView aliPlayerView = AliPlayerView(
        onCreated: onViewPlayerCreated,
        x: x,
        y: y,
        width: width,
        height: height);
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                  color: Colors.black,
                  child: Stack(
                    children: [
                      aliPlayerView
                    ],
                  ),
                  width: width,
                  height: height),
            ],
          ),
        );
      },
    );
  }

  ///设置播放源
  void onViewPlayerCreated() async {
    // this.fAliplayer.setUrl("https://alivc-demo-vod.aliyuncs.com/6b357371ef3c45f4a06e2536fd534380/53733986bce75cfc367d7554a47638c0-fd.mp4");

  }
}
