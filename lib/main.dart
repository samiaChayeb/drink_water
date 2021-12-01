import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/custom_splash_screen.dart';


PageController pageController = PageController(initialPage: 0);
int currentIndex = 0;

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
        backgroundColor: Colors.blueGrey.shade100,
        brightness: Brightness.light,
      ),
      home:CustomSplashScreen()
    );
  }
}
