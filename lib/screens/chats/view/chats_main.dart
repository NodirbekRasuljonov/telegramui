import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:telegramui/core/components/textstyle_comp.dart';
import 'package:telegramui/core/constants/color_const.dart';
import 'package:telegramui/core/constants/size_const.dart';
import 'package:telegramui/core/extension/size_extension.dart';
import 'package:telegramui/main/cubit/main_cubit.dart';
import 'package:telegramui/screens/chats/cubit/chats_cubit.dart';
import 'package:telegramui/screens/chats/state/chats_state.dart';
import 'package:telegramui/widgets/my_appbar.dart';
import 'package:on_click/on_click.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    motion: const ScrollMotion(),
                    children: [
                      Container(
                        height: context.h * 0.076,
                        width: context.h * 0.082,
                        color: Colors.white,
                      ),
                      Container(
                        height: context.h * 0.076,
                        width: context.h * 0.082,
                        color: const Color(0xff007EE5),
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
                        color: const Color(0xff00C900),
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
                    motion: const ScrollMotion(),
                    children: [
                      Container(
                        height: context.h * 0.076,
                        width: context.h * 0.082,
                        color: const Color(0xffF09A37),
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
                        color: const Color(0xffFE3B30),
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
                        color: const Color(0xffBBBBC3),
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
                        modalsheet(context);
                      },
                      onTap: () {
                        Navigator.pushNamed(context, '/pchat');
                      },
                      leading: const CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                      ),
                      title: const Text(
                        'Nodirbek Rasuljonov',
                      ),
                      subtitle: const Text("Let's choose the option"),
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

  Future<dynamic> modalsheet(BuildContext context) {
    return showMaterialModalBottomSheet(
      backgroundColor: const Color(0xff858E96).withOpacity(0.5),
      enableDrag: true,
      context: context,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Container(
                height: context.h * 0.503,
                width: context.h * 0.47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Container(
                      height: context.h * 0.05,
                      width: context.h * 0.5,
                      decoration: BoxDecoration(
                        color: context.watch<MainCubit>().isDark
                            ? const Color(0xff1C1C1D)
                            : const Color(0xffffffff),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: context.h * 0.005,
                            left: context.h * 0.12,
                            right: context.h * 0.12,
                            child: Text(
                              'Nodirbek Rasuljonov',
                              style: MyTextStleComp.style(
                                  size: SizeConst.medium, context: context),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Positioned(
                            top: context.h * 0.03,
                            left: context.h * 0.12,
                            right: context.h * 0.12,
                            child: Text(
                              'last seen just now',
                              style: TextStyle(
                                  color: ColorConst.greycolor, fontSize: 12.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Positioned(
                            top: context.h * 0.005,
                            right: context.h * 0.015,
                            child: Container(
                              height: context.h * 0.045,
                              width: context.h * 0.045,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: const Radius.circular(10.0)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: context.watch<MainCubit>().isDark
                                ? const AssetImage('assets/images/pmbgdark.png')
                                : const AssetImage(
                                    'assets/images/pmbglight.png'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 11.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Container(
                height: context.h * 0.25,
                width: context.h * 0.35,
                decoration: BoxDecoration(
                  color: context.watch<MainCubit>().isDark
                      ? const Color(0xff252525).withOpacity(0.8)
                      : const Color(0xffF9F9F9).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: bottomactions(
                          function: () {
                            debugPrint("Unread");
                          },
                          title: 'Mark as Unread',
                          icons: [
                            'assets/svg/bottomsheet/unreadlight.svg',
                            'assets/svg/bottomsheet/unreaddark.svg'
                          ],
                          context: context),
                    ),
                    Expanded(
                      child: bottomactions(
                          function: () {
                            debugPrint("Pinned");
                          },
                          title: 'Pin',
                          icons: [
                            'assets/svg/bottomsheet/pinlight.svg',
                            'assets/svg/bottomsheet/pindark.svg'
                          ],
                          context: context),
                    ),
                    Expanded(
                      child: bottomactions(
                          function: () {
                            debugPrint("Muted");
                          },
                          title: 'Mute',
                          icons: [
                            'assets/svg/bottomsheet/mutelight.svg',
                            'assets/svg/bottomsheet/mutedark.svg'
                          ],
                          context: context),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ColorConst.borderColor,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Delete',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 17.0),
                            ),
                            SvgPicture.asset(
                                'assets/svg/bottomsheet/delete.svg'),
                          ],
                        ),
                      ).onClick(() {
                        debugPrint("Deleted");
                       })
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget bottomactions(
      {required String title,
      required List<String> icons,
      required BuildContext context,
      required Function function}) {
    return Container(
      height: context.h * 0.06,
      width: context.h * 0.46,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorConst.borderColor,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: MyTextStleComp.style(size: 17.0, context: context),
          ),
          context.watch<MainCubit>().isDark
              ? SvgPicture.asset(icons[1])
              : SvgPicture.asset(icons[0]),
        ],
      ),
    ).onClick(() {
      function();
    });
  }
}
