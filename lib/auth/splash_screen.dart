import 'package:flutter/material.dart';
// استدعاء شاشة الـ Onboarding من نفس فولدر auth
import 'onboarding_screens.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            // الانتقال لشاشة الـ Onboarding بعد الـ Splash
            builder: (context) => const OnboardingScreen(), 
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // خلفية بيضاء نظيفة
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(
            "lib/assets/slogan c.png", // اللوجو فقط
            width: 800,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}