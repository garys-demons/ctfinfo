import 'package:ctfinfo/features/bottonnavbar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRouter(RouteSettings routeSetting) {
    // var args = routeSetting.arguments;
    switch (routeSetting.name) {
      case BottomNavBar.id:
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
          settings: routeSetting,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => BottomNavBar(),
          settings: routeSetting,
        );
    }
  }
}
