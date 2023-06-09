import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_insta_clone/Screens/auth/login_screen.dart';
import 'package:flutter_insta_clone/Screens/home_page.dart';
import 'package:flutter_insta_clone/main.dart';

import '../firebase_services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the main screen after the splash screen is finished
      splashServices.splashScreen(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // You can set the background color to whatever you like
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}
