
import 'package:flutter/cupertino.dart';
import 'package:telegramui/core/constants/color_const.dart';
import 'package:telegramui/core/constants/size_const.dart';
import 'package:telegramui/main/cubit/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppBarTextStyle{
    static TextStyle textStyle({required BuildContext context}){
    return TextStyle(
    fontSize: SizeConst.medium,
    color: context.watch<MainCubit>().isDark?ColorConst.darktext:ColorConst.kPrimaryColor
    
  );
  }
}

class MyTextStleComp{

  static TextStyle style({required double size,FontWeight? weight,required BuildContext context}){
    return TextStyle(
    color: context.watch<MainCubit>().isDark?ColorConst.darktext:ColorConst.lighttext,
    fontSize: size,
    fontWeight: weight,
  );
  }
}