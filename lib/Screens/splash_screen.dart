import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:wheel_of_life/Screens/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        nextScreen: const Onboarding(),
        splash: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.circle_outlined, size: 35,),
            Text("Wheel of life"),
            Icon(Icons.circle_outlined, size: 35,),
          ],
        ),
      ),
    );
  }
}