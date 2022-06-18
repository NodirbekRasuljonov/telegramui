import 'package:flutter/material.dart';
import 'package:on_click/on_click.dart';

class MyAppBar {
  static PreferredSizeWidget myAppBar({
    required Widget leadingwidget,
    required Function leadingfunc,
    required Widget actionwidget,
    required Function actionfunc,
    Widget? title,
  }) {
    return AppBar(
      centerTitle: true,
      title: title ?? Container(),
      leading: leadingwidget.onClick(() {
        leadingfunc();
      }),
      actions: [
        actionwidget.onClick(() {
          actionfunc();
        })
      ],
    );
  }
}
