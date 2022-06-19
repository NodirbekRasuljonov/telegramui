import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:telegramui/core/components/textstyle_comp.dart';
import 'package:telegramui/core/constants/color_const.dart';
import 'package:telegramui/core/extension/size_extension.dart';
import 'package:telegramui/widgets/my_appbar.dart';

class EditUserPage extends StatelessWidget {
  const EditUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.myAppBar(
        title: Text(
          'Info',
          style: MyTextStleComp.style(size: 17.0),
        ),
        leadingwidget: Text(
          'Cancel',
          style: MyAppBarTextStyle.style,
        ),
        leadingfunc: () {
          Navigator.pushReplacementNamed(context, '/userinfo');
        },
        actionwidget: Container(
          alignment: Alignment.center,
          child: Text(
            'Done',
            style: MyAppBarTextStyle.style,
          ),
        ),
        actionfunc: () {
          Navigator.pushReplacementNamed(context, '/userinfo');
        },
      ),
      body: Container(
        height: context.h,
        width: context.h,
        child: Column(
          children: [
            Container(
              height: context.h * 0.12,
              width: context.h * 0.5,
              // color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                      Container(
                        alignment: Alignment.center,
                        height: context.h * 0.05,
                        width: context.h * 0.33,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Nodirbek'
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: context.h * 0.05,
                        width: context.h * 0.33,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Rasuljonov'
                          ),
                          initialValue: 'Nodirbek',

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            mainPhone(context),
            homePhone(context),
            bio(context),
            notifications(context),
            delete(),
          ],
        ),
      ),
    );
  }

  ListTile delete() {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ColorConst.borderColor,
        ),
      ),
      title: const Text(
        'Delete Contact',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  ListTile notifications(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ColorConst.borderColor,
        ),
      ),
      title: Text(
        'Notifications',
        style: MyTextStleComp.style(
          size: 17.0,
        ),
      ),
      trailing: SizedBox(
        width: context.h * 0.15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Enabled',
              style: TextStyle(color: ColorConst.greycolor, fontSize: 17.0),
            ),
            Icon(
              Icons.chevron_right_outlined,
              color: ColorConst.greycolor,
            )
          ],
        ),
      ),
    );
  }

  Container bio(BuildContext context) {
    return Container(
      height: context.h * 0.07,
      width: context.h * 0.5,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'bio',
            style: MyTextStleComp.style(size: 14.0),
          ),
          Text(
            'Design adds value faster, than it adds cost',
            style: MyTextStleComp.style(size: 17.0),
          )
        ],
      ),
    );
  }

  Container homePhone(BuildContext context) {
    return Container(
      height: context.h * 0.07,
      width: context.h * 0.5,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
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
            style: MyTextStleComp.style(size: 14.0),
          ),
          Text(
            '+998931425672',
            style: MyAppBarTextStyle.style,
          )
        ],
      ),
    );
  }

  Container mainPhone(BuildContext context) {
    return Container(
      height: context.h * 0.07,
      width: context.h * 0.5,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
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
            style: MyTextStleComp.style(size: 14.0),
          ),
          Text(
            '+998931234567',
            style: MyAppBarTextStyle.style,
          )
        ],
      ),
    );
  }
}
