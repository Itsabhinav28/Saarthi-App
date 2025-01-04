import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:next_step/Const/const_colo.dart';
import 'package:next_step/Const/const_fonts.dart';
import 'package:next_step/Const/const_img.dart';
import 'package:next_step/Screen/Home_Screen/Home_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    // Navigate to LoginScreen after 3 seconds
    Future.delayed(Duration(seconds: 2), () {
      // Use Get.off() to navigate to the LoginScreen and remove the SplashScreen from the stack
      Get.off(() => HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,  // Background color from const_Var.dart
      body: Center(
        child: SingleChildScrollView(  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logo, height: 150, width: 150),  // Logo image
              SizedBox(height: 20),  // Adds space between the logo and the text
              Text(
                "Welcome To WaterWise",
                style: TextStyle(
                  fontSize: 18,  // Font size
                  fontWeight: FontWeight.bold,      
                  fontFamily: regularfont,  // Font family from const_fonts.dart
                  backgroundColor: Colors.white54,  // Background color for text
                ),
              ),
              SizedBox(height: 40), // Adds space between the two texts
              Text(
                "Welcome To WaterWise",  // You can change this to a different message if needed
                style: TextStyle(
                  fontSize: 18,  // Font size
                  fontWeight: FontWeight.bold,  // Font weight
                  fontFamily: boldfont,//ont family
                  backgroundColor: Colors.white54,  // Background color for text
                ),
              ),                          
            ],
          ),
        ),
      ),
    );
  }
}
