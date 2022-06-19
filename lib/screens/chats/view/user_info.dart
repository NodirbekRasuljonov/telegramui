import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegramui/core/components/textstyle_comp.dart';
import 'package:telegramui/core/constants/color_const.dart';
import 'package:telegramui/core/extension/size_extension.dart';
import 'package:telegramui/main/cubit/main_cubit.dart';
import 'package:telegramui/screens/chats/cubit/chats_cubit.dart';
import 'package:telegramui/screens/chats/state/chats_state.dart';
import 'package:telegramui/widgets/my_appbar.dart';
import 'package:on_click/on_click.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit, ChatsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar.myAppBar(
            context: context,
            title: Text(
              'Info',
              style: MyTextStleComp.style(
                context: context,
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
 style:MyAppBarTextStyle.textStyle(context: context),                )
              ],
            ),
            leadingfunc: () {
              Navigator.pop(context);
            },
            actionwidget: Container(
              alignment: Alignment.center,
              child: Text(
                'Edit',
 style:MyAppBarTextStyle.textStyle(context: context),              ),
            ),
            actionfunc: () {
              Navigator.pushReplacementNamed(context, '/edituser');
            },
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
      child: Column(
        children: [
          Container(
            height: context.h * 0.12,
            width: context.h * 0.5,
            // color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Container(
                  height: context.h * 0.08,
                  width: context.h * 0.08,
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
                SizedBox(
                  width: context.h * 0.03,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.h * 0.32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nodirbek Rasuljonov',
                            style: MyTextStleComp.style(size: 19.0,context: context),
                          ),
                          context.watch<MainCubit>().isDark
                              ? IconButton(
                                  onPressed: () {},
                                  icon:
                                      SvgPicture.asset('assets/svg/call1.svg'),
                                )
                              : SvgPicture.asset('assets/svg/call.svg')
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'online',
                      style: TextStyle(
                        color: ColorConst.kPrimaryColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: mainPhone(context)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: homePhone(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: bio(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: username(context),
          ),
          options(
              context: context,
              title: 'Send Message',
              function: () {
                debugPrint("Send Message");
              }),
          options(
              context: context,
              title: 'Share Contact',
              function: () {
                debugPrint("Contact Shared");
              }),
          options(
              context: context,
              title: 'Start Secret Chat',
              function: () {
                debugPrint("Started Secret Chat");
              }),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: context.h * 0.06,
            width: context.h * 0.46,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: ColorConst.borderColor,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shared Media', style: MyTextStleComp.style(size: 17.0,context: context)),
                Icon(
                  Icons.chevron_right_outlined,
                  color: ColorConst.greycolor,
                )
              ],
            ).onClick(
              () {
                debugPrint("Shared Media");
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: context.h * 0.06,
            width: context.h * 0.46,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: ColorConst.borderColor,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifications', style: MyTextStleComp.style(size: 17.0,context: context)),
                Row(
                  children: [
                    Text(
                      'Disabled',
                      style: TextStyle(color: ColorConst.greycolor),
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      color: ColorConst.greycolor,
                    )
                  ],
                )
              ],
            ).onClick(
              () {
                debugPrint("Notifications");
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: context.h * 0.06,
            width: context.h * 0.46,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: ColorConst.borderColor,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Groups In Common',
                    style: MyTextStleComp.style(size: 17.0,context: context)),
                Row(
                  children: [
                    Text(
                      '1',
                      style: TextStyle(color: ColorConst.greycolor),
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      color: ColorConst.greycolor,
                    )
                  ],
                )
              ],
            ).onClick(
              () {
                debugPrint("Groups");
              },
            ),
          ),
          const SizedBox(height: 15.0,),
          Container(
            alignment: Alignment.centerLeft,
            height: context.h * 0.06,
            width: context.h * 0.46,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: ColorConst.borderColor,
                ),
              ),
            ),
            child: const Text(
              'Block User',
              style: TextStyle(color: Colors.red, fontSize: 17.0),
            ),
          ).onClick(
            () {
              debugPrint("Blocked User");
            },
          ),
        ],
      ),
    );
  }

  Container bio(BuildContext context) {
    return Container(
      height: context.h * 0.07,
      width: context.h * 0.5,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorConst.borderColor),
        ),
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'bio',
            style: MyTextStleComp.style(size: 14.0,context: context),
          ),
          Text(
            'Design adds value faster, than it adds cost',
            style: MyTextStleComp.style(size: 17.0,context: context),
          )
        ],
      ),
    );
  }

  Container homePhone(BuildContext context) {
    return Container(
      height: context.h * 0.07,
      width: context.h * 0.5,
      // padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorConst.borderColor),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'home',
            style: MyTextStleComp.style(size: 14.0,context: context),
          ),
          Text(
            '+998931425672',
 style:MyAppBarTextStyle.textStyle(context: context),          )
        ],
      ),
    );
  }

  Container mainPhone(BuildContext context) {
    return Container(
      height: context.h * 0.07,
      width: context.h * 0.5,
      // padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorConst.borderColor),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'main',
            style: MyTextStleComp.style(size: 14.0,context: context),
          ),
          const Text(
            '+998931234567',
            style: TextStyle(color: Colors.green),
          )
        ],
      ),
    );
  }

  Container username(BuildContext context) {
    return Container(
      height: context.h * 0.07,
      width: context.h * 0.5,
      // padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorConst.borderColor),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'username',
            style: MyTextStleComp.style(size: 14.0,context: context),
          ),
          Text(
            '@zack_life',
 style:MyAppBarTextStyle.textStyle(context: context),          )
        ],
      ),
    );
  }

  Widget options(
      {required BuildContext context,
      required String title,
      required Function function}) {
    return Container(
      alignment: Alignment.centerLeft,
      height: context.h * 0.06,
      width: context.h * 0.46,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorConst.borderColor,
          ),
        ),
      ),
      child: Text(title,
          style: TextStyle(color: ColorConst.kPrimaryColor, fontSize: 17.0)),
    ).onClick(() {
      function();
    });
  }
}
