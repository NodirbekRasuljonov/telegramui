import 'package:flutter/cupertino.dart';
import 'package:telegramui/core/constants/color_const.dart';
import 'package:telegramui/core/constants/size_const.dart';

class MyAppBarTextStyle{
  static TextStyle style=TextStyle(
    fontSize: SizeConst.medium,
    color: ColorConst.kPrimaryColor
  );
}

class MyTextStleComp{

  static TextStyle style({required double size,FontWeight? weight}){
    return TextStyle(
    color: ColorConst.lighttext,
    fontSize: size,
    fontWeight: weight,
  );
  }
}