import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
