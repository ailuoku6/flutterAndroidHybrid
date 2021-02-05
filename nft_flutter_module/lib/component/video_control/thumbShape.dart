import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MythumbShape extends SliderComponentShape{

  const MythumbShape(
      this.enableSize, this.disableSize, this.image,
  );

  final double enableSize;
  final double disableSize;
  final ui.Image image;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    // TODO: implement getPreferredSize
    var size = isEnabled?this.enableSize:this.disableSize;
    return Size(size,size);
  }

  @override
  void paint(PaintingContext context, Offset center, {Animation<double> activationAnimation, Animation<double> enableAnimation, bool isDiscrete, TextPainter labelPainter, RenderBox parentBox, SliderThemeData sliderTheme, TextDirection textDirection, double value, double textScaleFactor, Size sizeWithOverflow}) {
    // TODO: implement paint
    final canvas = context.canvas;
    final height = enableSize;
    final width = enableSize;
    Offset offset = Offset(width/2, height/2);
    Paint paint = Paint()..filterQuality = FilterQuality.high;
    if(image!=null){
      canvas.drawImage(image, offset, paint);
    }
  }

}