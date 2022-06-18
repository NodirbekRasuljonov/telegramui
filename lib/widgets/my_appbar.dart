import 'package:flutter/material.dart';
import 'package:on_click/on_click.dart';
import 'package:telegramui/core/constants/color_const.dart';

class MyAppBar {
  static PreferredSizeWidget myAppBar({
    required Widget leadingwidget,
    required Function leadingfunc,
    required Widget actionwidget,
    required Function actionfunc,
    Widget? title,
  }) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: ColorConst.transparent,
      centerTitle: true,
      title: title ?? Container(),
      leadingWidth: 100.0,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: leadingwidget.onClick(() {
          leadingfunc();
        }),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: actionwidget.onClick(() {
            actionfunc();
          }),
        ),
      ],
    );
  }
}
