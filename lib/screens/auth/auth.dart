import 'package:flutter/material.dart';
import 'package:telegramui/core/components/textstyle_comp.dart';
import 'package:telegramui/widgets/my_appbar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.myAppBar(
        leadingwidget: Text(
          "Cancel",
          style: MyTextStleComp.style,
        ),
        leadingfunc: () {
          Navigator.pop(context);
        },
        actionwidget: Text(
          'Next',
          style: MyTextStleComp.style,
        ),
        actionfunc: () {
          Navigator.pushNamedAndRemoveUntil(context, '/next', (route) => false);
        },
      ),
    );
  }
}
