import 'package:flutter/material.dart';
import 'profil_screen.dart';
import 'calculator_screen.dart';
import 'advice_screen.dart';
import '../main.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            ProfilScreen(),
            CalculatorScreen(),
            AdviceScreen(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
