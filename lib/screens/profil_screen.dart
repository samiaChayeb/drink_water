import 'package:custom_bottombar/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_user_profil.dart';
import 'package:flutter/cupertino.dart';
import '../model/user.dart';
import 'water_bottle.dart';
import '../utils/globals.dart' as globals;
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import '../utils/Reusable_card.dart';
import '../utils/constants.dart';

class ProfilScreen extends StatefulWidget {
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  static const user = User(
    imagePath:
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Samia CHAYEB',
    email: 'samia.chayeb@gmail.com',
    about:
        'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              headerName(),
              buildPercentGoal(),
              buildInformationCard(),
            ],
          )),
    );
  }

  Widget headerName() => SizedBox(
      height: 220,
      width: double.infinity,
      child: ReusableCard(
          colour: kActiveCardColor,
          cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomUserProfil(
                  onClicked: () async {},
                ),
                buildName(user),
              ])));

  Widget buildName(User user) => Center(
          child: Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ));

  Widget buildPercentGoal() => SizedBox(
      height: 300,
      width: double.infinity,
      child: ReusableCard(
          colour: kActiveCardColor,
          cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 250,
                    width: 250,
                    child: LiquidCircularProgressIndicator(
                      value: globals.percentDrinkedWater / 100,
                      // Defaults to 0.5.
                      valueColor:
                          AlwaysStoppedAnimation(Colors.lightBlueAccent),
                      backgroundColor: Colors.white,
                      borderColor: Colors.lightBlue,
                      borderWidth: 4.0,
                      direction: Axis.vertical,
                      center: Text(
                        globals.percentDrinkedWater.toString() + "%",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ))
              ])));

  Widget buildInformationCard() => SizedBox(
          child: Row(children: <Widget>[
        SizedBox(
            height: 100,
            width: 200,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Buvé',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                        fontSize: 18),
                  ),
                  Text(
                    globals.drinkedWater.toString() + ' Litres',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                        fontSize: 18),
                  ),
                ],
              ),
            )),
        SizedBox(
            height: 100,
            width: 200,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Goal',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                        fontSize: 18),
                  ),
                  Text(
                    globals.waterLevelNeeds.toString() + ' Litres',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                        fontSize: 18),
                  )
                ],
              ),
            )),
      ]));
}
