import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_step/Const/const_colo.dart';
import 'package:next_step/Const/const_fonts.dart';
import 'package:next_step/Const/const_img.dart';
import 'package:next_step/Screen/Avatar/ChooseAvtar.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Import for typewriter effect

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to ChooseAvatarScreen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => ChooseAvatarScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor, // Background color
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logo2, height: 250, width: 250), // Logo image
              const SizedBox(height: 20), // Space
              const Text(
                "𝐒𝐀𝐀𝐑𝐓𝐇𝐈",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: regularfont,
                  backgroundColor: Colors.white54,
                ),
              ),
              const SizedBox(height: 40), // Space
              Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Your Companion in Learning, \nAnytime, Anywhere",
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: boldfont,
                        color: Colors.black, // Text color
                      ),
                      textAlign: TextAlign.center, // Align text to center
                      speed: const Duration(milliseconds: 50), // Typing speed
                    ),
                  ],
                  totalRepeatCount: 1, // Runs once
                  pause: const Duration(milliseconds: 500), // Pause at the end
                  displayFullTextOnTap: true, // Show full text if tapped
                  stopPauseOnTap: true, // Stops animation if tapped
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
