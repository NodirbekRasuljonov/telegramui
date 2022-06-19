
import 'package:flutter/material.dart';
import 'package:telegramui/screens/auth/view/auth.dart';
import 'package:telegramui/screens/chats/view/edit_user.dart';
import 'package:telegramui/screens/chats/view/private_chat.dart';
import 'package:telegramui/screens/chats/view/user_info.dart';
import 'package:telegramui/screens/home/view/main_home.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/auth':
        return MaterialPageRoute(
          builder: (context) => AuthPage(),
        );
        case '/main':
        return MaterialPageRoute(
          builder: (context) => MainHomePage(),
        );
        case '/pchat':
        return MaterialPageRoute(
          builder: (context) => PrivateChat(),
        );
        case '/userinfo':
        return MaterialPageRoute(
          builder: (context) => UserInfo(),
        );
        case '/edituser':
        return MaterialPageRoute(
          builder: (context) => EditUserPage(),
        );

    }
  }
}
