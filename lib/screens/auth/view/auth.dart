import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramui/core/components/textstyle_comp.dart';
import 'package:telegramui/core/constants/size_const.dart';
import 'package:telegramui/core/extension/size_extension.dart';
import 'package:telegramui/screens/auth/cubit/auth_cubit.dart';
import 'package:telegramui/screens/auth/state/auth_state.dart';
import 'package:telegramui/widgets/my_appbar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar.myAppBar(
            context: context,
            leadingwidget: Text(
              "Cancel",
 style:MyAppBarTextStyle.textStyle(context: context),            ),
            leadingfunc: () {
              Navigator.pop(context);
            },
            actionwidget: Text(
              'Next',
 style:MyAppBarTextStyle.textStyle(context: context),            ),
            actionfunc: () {
              context.read<AuthCubit>().phonecheck(context: context);
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
      width: context.w,
      child: Stack(
        children: [
          Positioned(
            top: context.h * 0.017,
            left: context.h * 0.115,
            right: context.h * 0.115,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Your Phone',
                style: MyTextStleComp.style(size: 30.0,context: context),
              ),
            ),
          ),
          Positioned(
            top: context.h * 0.072,
            left: context.h * 0.062,
            right: context.h * 0.062,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Please confirm your country code and enter your phone number.',
                style: MyTextStleComp.style(
                  size: SizeConst.medium,
                  context: context
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          
          Positioned(
            top: context.h * 0.210,
            left: context.h * 0.0,
            right: context.h * 0.0,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: context.h*0.02),
              child: Row(
                children: [
                  Container(
                height: context.h * 0.058,
                width: context.h * 0.07,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 160, 160, 160),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  '+998',
                  style: MyTextStleComp.style(
                    size: 20.0,
                    context: context
                  ),
                ),
              ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 160, 160, 160),
                      ),
                    ),
                    height: context.h * 0.058,
                    width: context.h * 0.39,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Your phone number',
                        hintStyle: TextStyle(
                          color: Color(0xff3c3c43).withOpacity(0.3),
                        ),
                      ),
                      controller: context.watch<AuthCubit>().phonenumbercontroller,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: context.h*0.284,
            left: 0.0,
            right: 0.0,
            child: SwitchListTile.adaptive(
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              selectedTileColor: Colors.blue,
              activeColor: Colors.white,
              title: Text(
                'Sync contacts',
                style: MyTextStleComp.style(
                  size: SizeConst.medium,
                  context: context
                ),
              ),
              value: context.watch<AuthCubit>().sync,
              onChanged: (v) {
                context.read<AuthCubit>().changesync(v: v);
              },
            ),
          ),
        ],
      ),
    );
  }
}
