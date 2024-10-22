import 'package:flutter/material.dart';
import 'package:midow_app/presentation/auth/onboarding.dart';

void main() {
  runApp(const MidowApp());
}

class MidowApp extends StatelessWidget {
  const MidowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Mulish',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const OnboardingScreen(),
    );
  }
}



