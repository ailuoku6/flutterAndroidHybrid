import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter_module/component/video_control/thumbShape.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class videoControl extends StatelessWidget{
  const videoControl({
    Key key,
    this.duration, this.curTime, this.isPlaying, this.pause, this.play, this.seekTo, this.show, this.togglePlay,
  }):super(key: key);
  final bool show;
  final double duration;
  final double curTime;
  final bool isPlaying;
  final Function pause;
  final Function play;
  final Function seekTo;
  final Function togglePlay;

  Widget _initScreen(Widget child){
    return ScreenUtilInit(
      designSize: Size(360,690),
        child: child
    );
  }

  customHandler(){
    return FlutterSliderHandler(
      decoration: BoxDecoration(),
      // child: Container(
      //   height: 10,
      //   width: 10,
      //   color: Colors.blue,
      // )
      child: Image(image: AssetImage('assets/thumb.png')),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height:200,
      width: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            child: Icon(this.isPlaying?Icons.play_circle_fill:Icons.pause_circle_filled),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 80,
              width: 400,
              // color: Colors.amber,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(this.isPlaying?Icons.play_circle_fill:Icons.pause_circle_filled),
                  ),
                  Text(this.curTime.toString()),
                  //进度条
                  // Image(image: AssetImage('assets/thumb.png')),
                  Expanded(
                    child: FlutterSlider(
                      tooltip: FlutterSliderTooltip(disabled: true),
                      values: [10],
                      min: 0,
                      max: 100,
                      handler: customHandler()
                    ),

                  ),
                  Text(this.duration.toString()),
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.rotate_right_outlined),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

}