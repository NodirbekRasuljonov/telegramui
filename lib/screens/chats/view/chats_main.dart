import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegramui/core/components/textstyle_comp.dart';
import 'package:telegramui/core/constants/color_const.dart';
import 'package:telegramui/core/constants/size_const.dart';
import 'package:telegramui/core/extension/size_extension.dart';
import 'package:telegramui/main/cubit/main_cubit.dart';
import 'package:telegramui/screens/chats/cubit/chats_cubit.dart';
import 'package:telegramui/screens/chats/state/chats_state.dart';
import 'package:telegramui/widgets/my_appbar.dart';
import 'package:on_click/on_click.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({Key? key}) : super(key: key);

  get doNothing => null;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit, ChatsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar.myAppBar(
            context: context,
            title: Text(
              'Chats',
              style: MyTextStleComp.style(
                context: context,
                weight: FontWeight.w600,
                size: SizeConst.medium,
              ),
            ),
            leadingwidget: Text(
              "Edit",
              style: MyAppBarTextStyle.textStyle(context: context),
            ),
            leadingfunc: () {},
            actionwidget: context.watch<MainCubit>().isDark
                ? SvgPicture.asset('assets/svg/editdark.svg')
                : SvgPicture.asset('assets/svg/editlight.svg'),
            actionfunc: () {},
          ),
          body: body(context),
        );
      },
      listener: (context, state) {},
    );
  }

  Container body(BuildContext context) {
    return Container(
      height: context.h,
      width: context.h,
      child: Column(
        children: [
          Container(
            height: context.h * 0.036,
            width: context.h * 0.355,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xff767680).withOpacity(0.11),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.search_outlined, color: Colors.grey),
                Text(
                  'Search of massages or users',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ).onClick(
            () {},
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Slidable(
                  startActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      Container(
                        height: context.h * 0.076,
                        width: context.h * 0.082,
                        color: Colors.white,
                      ),
                      Container(
                        height: context.h * 0.076,
                        width: context.h * 0.082,
                        color: Color(0xff007EE5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/unread.svg'),
                            Text(
                              'Unread',
                              style: TextStyle(
                                color: ColorConst.darktext,
                              ),
                            ),
                          ],
                        ),
                      ).onClick(() {
                        debugPrint('Unread');
                      }),
                      Container(
                        height: context.h * 0.076,
                        width: context.h * 0.082,
                        color: Color(0xff00C900),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/pin.svg'),
                            Text(
                              'Pin',
                              style: TextStyle(
                                color: ColorConst.darktext,
                              ),
                            ),
                          ],
                        ),
                      ).onClick(() {
                        debugPrint('Pin');
                      }),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      Container(
                        height: context.h * 0.076,
                        width: context.h * 0.082,
                        color: Color(0xffF09A37),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/mute.svg'),
                            Text(
                              'Mute',
                              style: TextStyle(
                                color: ColorConst.darktext,
                              ),
                            ),
                          ],
                        ),
                      ).onClick(() {
                        debugPrint('Mute');
                      }),
                      Container(
                        height: context.h * 0.076,
                        width: context.h * 0.082,
                        color: Color(0xffFE3B30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/delete.svg'),
                            Text(
                              'Delete',
                              style: TextStyle(
                                color: ColorConst.darktext,
                              ),
                            ),
                          ],
                        ),
                      ).onClick(() {
                        debugPrint('Delete');
                      }),
                      Container(
                        height: context.h * 0.076,
                        width: context.h * 0.082,
                        color: Color(0xffBBBBC3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/archive.svg'),
                            Text(
                              'Archive',
                              style: TextStyle(
                                color: ColorConst.darktext,
                              ),
                            ),
                          ],
                        ),
                      ).onClick(() {
                        debugPrint('Archive');
                      }),
                    ],
                  ),
                  child: Container(
                    height: context.h * 0.076,
                    width: context.h * 0.54,
                    child: ListTile(
                      tileColor: Colors.transparent,
                      selectedTileColor: Colors.transparent,
                      onLongPress: () {
                        debugPrint("Long");
                      },
                      onTap: () {
                        Navigator.pushNamed(context, '/pchat');
                      },
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                      ),
                      title: Text(
                        'Nodirbek Rasuljonov',
                      ),
                      subtitle: Text("Let's choose the option"),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sun',
                            style: TextStyle(
                              color: context.watch<MainCubit>().isDark
                                  ? ColorConst.darktext
                                  : ColorConst.lighttext,
                            ),
                          ),
                          Container(
                            height: context.h * 0.02,
                            width: context.h * 0.03,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey),
                            child: Text(
                              '11',
                              style: TextStyle(
                                color: context.watch<MainCubit>().isDark
                                    ? ColorConst.lighttext
                                    : ColorConst.darktext,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 15,
            ),
          )
        ],
      ),
    );
  }
}
