import 'dart:js';

import 'package:flutter/material.dart';
import 'package:telegramui/screens/auth/auth.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/auth':
        return MaterialPageRoute(
          builder: (context) => AuthPage(),
        );
    }
  }
}
