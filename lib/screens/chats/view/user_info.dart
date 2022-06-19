import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramui/core/components/textstyle_comp.dart';
import 'package:telegramui/core/constants/color_const.dart';
import 'package:telegramui/core/constants/size_const.dart';
import 'package:telegramui/main/cubit/main_cubit.dart';
import 'package:telegramui/screens/chats/cubit/chats_cubit.dart';
import 'package:telegramui/screens/chats/state/chats_state.dart';
import 'package:telegramui/widgets/my_appbar.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit,ChatsState>(builder: (context,state){
      return Scaffold(
      appBar: MyAppBar.myAppBar(
        title: Text(
          'Info',
          style: MyTextStleComp.style(
            size: 17,
          ),
        ),
        leadingwidget: Row(
          children: [
            Icon(
              Icons.chevron_left_outlined,
              color: context.watch<MainCubit>().isDark
                  ? ColorConst.darktext
                  : ColorConst.kPrimaryColor,
            ),
            Text(
              'Back',
              style: MyAppBarTextStyle.style,
            )
          ],
        ),
        leadingfunc: () {
          Navigator.pop(context);
        },
        actionwidget: Container(
          alignment: Alignment.center,
          child: Text(
            'Edit',
            style: MyAppBarTextStyle.style,
          ),
        ),
        actionfunc: () {
          Navigator.pushNamed(context, '/edituser');
        },
      ),
    );
    }, listener: (context,state){},);
  }
}
