import 'package:flutter/material.dart';
import 'inputPage.dart';

class SoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff090C22),
        scaffoldBackgroundColor: Color(0xff090C22),
      ),
      home: InputPage(),
    );
  }
}
