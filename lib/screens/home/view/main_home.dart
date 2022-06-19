import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegramui/core/constants/color_const.dart';
import 'package:telegramui/core/extension/size_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramui/screens/calls/view/calls_view.dart';
import 'package:telegramui/screens/chats/view/chats_main.dart';
import 'package:telegramui/screens/home/cubit/main_home_cubit.dart';
import 'package:telegramui/screens/home/state/main_home_state.dart';
import 'package:on_click/on_click.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MainHomeCubit,MainHomeState>(builder: (context,state){
        if(state is MainHomeContactsState){
          return Container(color:Colors.red);
        }
        else if(state is MainHomeCallsState){
          return CallsView();
        }
        else if(state is MainHomeChatsState){
          return ChatsView();
        }
        else{
          return Container(
            color: Colors.blue,
          );
        }
      }, listener: (context,state){}),
      bottomNavigationBar: Container(
        height: context.h * 0.083,
        width: context.h * 0.375,
        child: Row(
          children: [
            bars(
              label: 'Contacts',
              icon: [
                'assets/svg/personnotsel.svg',
                'assets/svg/personsel.svg',
              ],
              index: 0,
              context: context,
            ),
            bars(
              label: 'Calls',
              icon: [
                'assets/svg/callnotsel.svg',
                'assets/svg/callsel.svg',
              ],
              index: 1,
              context: context,
            ),
            bars(
              label: 'Chats',
              icon: [
                'assets/svg/chatsnotsel.svg',
                'assets/svg/chatssel.svg',
              ],
              index: 2,
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Expanded bars(
      {required String label,
      required List<String> icon,
      required int index,
      required BuildContext context}) {
    return Expanded(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            context.watch<MainHomeCubit>().currentindex == index
                ? SvgPicture.asset(icon[1])
                : SvgPicture.asset(icon[0]),
            Text(
              label,
              style: TextStyle(
                color: context.watch<MainHomeCubit>().currentindex == index
                    ? ColorConst.kPrimaryColor
                    : ColorConst.greycolor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ).onClick(
        () {
          context.read<MainHomeCubit>().changetheIndex(index: index);
        },
      ),
    );
  }
}
