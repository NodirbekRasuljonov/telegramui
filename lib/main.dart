import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramui/core/components/theme_comp.dart';
import 'package:telegramui/main/cubit/main_cubit.dart';
import 'package:telegramui/main/state/main_state.dart';
import 'package:telegramui/routes/app_routes.dart';
import 'package:telegramui/screens/auth/cubit/auth_cubit.dart';
import 'package:telegramui/screens/calls/cubit/calls_cubit.dart';
import 'package:telegramui/screens/chats/cubit/chats_cubit.dart';
import 'package:telegramui/screens/home/cubit/main_home_cubit.dart';

void main(List<String> args) {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => MainHomeCubit(),
        ),
        BlocProvider(
          create: (context) => ChatsCubit(),
        ),
        BlocProvider(
          create: (context) => CallsCubit(),
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
                ? theme.darkTheme
                : theme.lightTheme,
            onGenerateRoute: appRoutes.onGenerateRoute,
            initialRoute: '/main',
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
