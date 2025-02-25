import 'dart:async';
import 'package:ctfinfo/constants/image_constants.dart';
import 'package:ctfinfo/features/bottonnavbar/bottom_nav_bar.dart';
import 'package:ctfinfo/style/pallet.dart';
import 'package:ctfinfo/utils/shared_preferences.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await SharedPreferencesDemo.init();

    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BottomNavBar())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.blackColour,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Image.asset(ImageConstants.logo, height: 200),
          ],
        ),
      ),
    );
  }
}
