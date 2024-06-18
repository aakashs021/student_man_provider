
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_management/features/home/presentation/ui/widgets/home_screen.dart';

Container splashcontent() {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 171, 212, 231),
          Color.fromARGB(255, 101, 182, 219),
          Color.fromARGB(255, 41, 158, 221),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: AnimatedSplashScreen(
      splashIconSize: 500,
      duration: 2000,
      splash: Center(
        child: Lottie.asset(
          'assets/lotties/splash_student.json',
        ),
      ),
      nextScreen: const HomeScreen(),
      backgroundColor: Colors.transparent,
    ),
  );
}
