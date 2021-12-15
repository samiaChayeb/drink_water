import 'package:custom_bottombar/screens/water_alerte.dart';
import 'package:flutter/material.dart';
import 'profil_screen.dart';
import 'calculator_screen.dart';
import 'advice_screen.dart';
import '../main.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:async';
import '../utils/globals.dart' as globals;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showAlerte() {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      body: const Center(
        child: Text(
          'Time To drink Water !.',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      title: 'Because we carre',
      desc: 'This is also Ignored',
      btnOkOnPress: () {
        setState(() {
          globals.drinkedWater += 0.2;
          globals.percentDrinkedWater = double.parse(
              (globals.drinkedWater / globals.waterLevelNeeds)
                  .toStringAsFixed(2));
        });
      },
    ).show();
  }

  @override
  void initState() {
    Timer.periodic(const Duration(hours: 1), (Timer timer) {
      showAlerte();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
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
