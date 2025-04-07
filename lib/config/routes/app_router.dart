import 'package:country_state_dropdown_app/features/location/presentation/view/home_screen.dart';
import 'package:country_state_dropdown_app/features/location/presentation/view/view_location_screen.dart';
import 'package:flutter/material.dart';

import '../../config/routes/routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(settings: settings, builder: (context) => const HomeScreen());
      case Routes.viewLocationScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ViewLocationScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
