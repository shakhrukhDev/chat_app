import 'package:flutter/material.dart';

class ElevatedButtonStyle{
  static  ButtonStyle items({ String? text,required double radius,required double width,Color? color}){
    return ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize:  Size(width, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        )
    );
  }
}