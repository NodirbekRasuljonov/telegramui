import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:on_click/extensions/click_extension.dart';
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
        context: context,
        title: Text(
          'Info',
          style: MyTextStleComp.style(size: 17.0, context: context),
        ),
        leadingwidget: Text(
          'Cancel',
          style: MyAppBarTextStyle.textStyle(context: context),
        ),
        leadingfunc: () {
          Navigator.pushReplacementNamed(context, '/userinfo');
        },
        actionwidget: Container(
          alignment: Alignment.center,
          child: Text(
            'Done',
            style: MyAppBarTextStyle.textStyle(context: context),
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
                      Container(
                        alignment: Alignment.center,
                        height: context.h * 0.05,
                        width: context.h * 0.33,
                        child: TextFormField(
                          initialValue: 'Nodirbek',
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: context.h * 0.05,
                        width: context.h * 0.33,
                        child: TextFormField(
                          initialValue: 'Rasuljonov',
                        ),
                      ),
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
                Text('Notifications',
                    style: MyTextStleComp.style(size: 17.0,context: context)),
                Row(
                  children: [
                    Text(
                      'Enabled',
                      style: TextStyle(color: ColorConst.greycolor),
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      color: ColorConst.greycolor,
                    )
                  ],
                )
              ],
            )
          ).onClick(
              () {
                debugPrint("Noitifications");
              },
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
            child: 
                Text('Delete Contact',
                    style: TextStyle(color: Colors.red,fontSize: 17.0)),
                
            ).onClick(
              () {
                debugPrint("Delete contact");
              },
            ),
          
          ],
        ),
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

}
