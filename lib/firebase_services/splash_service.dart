import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Screens/auth/login_screen.dart';
import 'package:flutter_insta_clone/Screens/home_page.dart';

class SplashServices {
  void splashScreen(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      // );
    }
  }
}
