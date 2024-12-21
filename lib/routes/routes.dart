import 'package:ctfinfo/features/bottonnavbar/bottom_nav_bar.dart';
import 'package:ctfinfo/features/event/screens/event_detail_screen.dart';
import 'package:ctfinfo/features/event/screens/event_screen.dart';
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

      case EventScreen.id:
        return MaterialPageRoute(
          builder: (context) => const EventScreen(),
          settings: routeSetting,
        );

      case EventDetailScreen.id:
        return MaterialPageRoute(
          builder: (context) => const EventDetailScreen(),
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
