import 'package:ctfinfo/features/event/provider/event_provider.dart';
import 'package:ctfinfo/features/splash/splash_screen.dart';
import 'package:ctfinfo/features/teams/provider/team_provider.dart';
import 'package:ctfinfo/routes/routes.dart';
import 'package:ctfinfo/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RouteSettings? deepLinkinRouteSettings;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EventProvider>.value(value: EventProvider()),
        ChangeNotifierProvider<TeamProvider>.value(value: TeamProvider())
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'CTF Info',
        theme: CustomTheme.darkTheme(),
        onGenerateRoute: (settings) =>
            RouteGenerator.getRouter(deepLinkinRouteSettings ?? settings),
        home: const SplashScreen(),
      ),
    );
  }
}
