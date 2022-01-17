import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import '../screens/login.dart';

class CustomSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 10,
        title: new Text("let's drink",
            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25)),
        image: new Image.asset('assets/images/welcome.jpg'),
        photoSize: 200.0,
        navigateAfterSeconds: LoginScreen());
  }
}
