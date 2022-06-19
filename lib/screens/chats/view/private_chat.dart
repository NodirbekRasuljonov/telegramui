import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramui/core/components/textstyle_comp.dart';
import 'package:telegramui/core/constants/color_const.dart';
import 'package:telegramui/main/cubit/main_cubit.dart';
import 'package:telegramui/screens/chats/cubit/chats_cubit.dart';
import 'package:telegramui/screens/chats/state/chats_state.dart';
import 'package:telegramui/widgets/my_appbar.dart';

class PrivateChat extends StatelessWidget {
  const PrivateChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit,ChatsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar.myAppBar(
            leadingwidget: Row(children: [
              Icon(
                Icons.chevron_left_outlined,
                color: context.watch<MainCubit>().isDark
                    ? ColorConst.darktext
                    : ColorConst.kPrimaryColor,
              ),
              Text('Chats', style: MyAppBarTextStyle.style),
            ]),
            leadingfunc: () {
              Navigator.pop(context);
            },
            actionwidget:const CircleAvatar(
              radius: 24.0,
              backgroundImage: CachedNetworkImageProvider(
                'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
              ),
            ),
            actionfunc: () {
              Navigator.pushNamed(context, '/userinfo');
            },
            title: Column(
              children: [
                Text(
                  'Nodirbek Rasuljonov',
                  style: MyTextStleComp.style(
                    size: 17.0,
                  ),
                ),
                Text(
                  'last seen just now',
                  style: MyTextStleComp.style(
                    size: 13.0,
                  ),
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
