import 'package:ctfinfo/features/event/provider/event_provider.dart';
import 'package:ctfinfo/features/splash/splash_screen.dart';
import 'package:ctfinfo/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        ChangeNotifierProvider<EventProvider>.value(value: EventProvider())
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'CTF Info',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: GoogleFonts.dmMono().fontFamily,
        ),
        onGenerateRoute: (settings) =>
            RouteGenerator.getRouter(deepLinkinRouteSettings ?? settings),
        home: const SplashScreen(),
      ),
    );
  }
}
