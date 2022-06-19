import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramui/screens/calls/cubit/calls_cubit.dart';
import 'package:telegramui/screens/calls/state/calls_state.dart';
import 'package:telegramui/widgets/my_appbar.dart';

class CallsView extends StatelessWidget {
  const CallsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CallsCubit,CallsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar.myAppBar(
            leadingwidget: Container(),
            leadingfunc: () {},
            actionwidget: Icon(Icons.add),
            actionfunc: () {
              debugPrint("Add page");
            },
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
