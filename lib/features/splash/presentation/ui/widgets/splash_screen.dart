import 'package:flutter/material.dart';
import 'package:student_management/features/splash/presentation/ui/widgets/splash_content.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: splashcontent(),
    );
  }
}
