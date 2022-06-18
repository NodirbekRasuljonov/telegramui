import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramui/core/components/theme_comp.dart';
import 'package:telegramui/main/cubit/main_cubit.dart';
import 'package:telegramui/main/state/main_state.dart';
import 'package:telegramui/routes/app_routes.dart';

void main(List<String> args) {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRoutes appRoutes = AppRoutes();
    return BlocConsumer<MainCubit, MainState>(
      builder: (context, state) {
        ThemeComp theme = ThemeComp();
        if (state is MainInitialState) {
          return MaterialApp(
            theme: context.read<MainCubit>().isDark
                ? theme.lightTheme
                : theme.darkTheme,
            onGenerateRoute: appRoutes.onGenerateRoute,
            initialRoute: '/auth',
            debugShowCheckedModeBanner: false,
          );
        } else {
          return Container();
        }
      },
      listener: (context, state) {},
    );
  }
}
