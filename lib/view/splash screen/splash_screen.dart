import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:student_database/core/colors/colour_const.dart';
import 'package:student_database/view/home%20screen/home_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: appBarColour,
      splash: Icons.travel_explore,
      nextScreen: HomeScreen(),
      duration: 3000,
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
