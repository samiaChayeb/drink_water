import 'package:flutter/material.dart';
import 'ProfilScreen.dart';
import 'SoundScreen.dart';
import 'AdviceScreen.dart';
import '../main.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
        )),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            ProfilScreen(),
            SoundScreen(),
            AdviceScreen(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
