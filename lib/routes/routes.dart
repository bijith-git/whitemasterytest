import 'package:flutter/material.dart';

import '../views/views.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/profile':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => ProfileScreen(userImg: args),
          );
        }
        return MaterialPageRoute(
          builder: (_) =>
              const ErrorScreen(errorMessage: 'Invalid arguments for profile'),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              ErrorScreen(errorMessage: 'Route not found: ${settings.name}'),
        );
    }
  }
}
