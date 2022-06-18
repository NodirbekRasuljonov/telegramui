
import 'package:flutter/material.dart';
import 'package:telegramui/screens/auth/view/auth.dart';
import 'package:telegramui/screens/chats/view/chats_main.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/auth':
        return MaterialPageRoute(
          builder: (context) => AuthPage(),
        );
        case '/chats':
        return MaterialPageRoute(
          builder: (context) => MainChatsPage(),
        );
    }
  }
}
