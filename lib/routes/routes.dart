import 'package:ctfinfo/features/bottonnavbar/bottom_nav_bar.dart';
import 'package:ctfinfo/features/event/screens/event_detail_screen.dart';
import 'package:ctfinfo/features/event/screens/event_screen.dart';
import 'package:ctfinfo/features/resources/screens/resources_screen.dart';
import 'package:ctfinfo/features/teams/screens/team_details_screen.dart';
import 'package:ctfinfo/features/teams/screens/team_list_screen.dart';
import 'package:ctfinfo/features/teams/screens/teamid_input_screen.dart';
import 'package:ctfinfo/features/teams/screens/your_team_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRouter(RouteSettings routeSetting) {
    var args = routeSetting.arguments;
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
          builder: (context) {
            final eventId = args;
            return EventDetailScreen(
              eventId: eventId.toString(),
            );
          },
          settings: routeSetting,
        );
      case TeamListScreen.id:
        return MaterialPageRoute(
          builder: (context) => const TeamListScreen(),
          settings: routeSetting,
        );

      case TeamDetailsScreen.id:
        return MaterialPageRoute(
          builder: (context) {
            final teamId = args;
            return TeamDetailsScreen(
              teamId: teamId.toString(),
            );
          },
          settings: routeSetting,
        );

      case YourTeamScreen.id:
        return MaterialPageRoute(
          builder: (context) => YourTeamScreen(),
          settings: routeSetting,
        );

      case TeamidInputScreen.id:
        return MaterialPageRoute(
          builder: (context) => const TeamidInputScreen(),
          settings: routeSetting,
        );
      case ResourcesScreen.id:
        return MaterialPageRoute(
          builder: (context) => const ResourcesScreen(),
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
