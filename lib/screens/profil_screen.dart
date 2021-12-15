import 'package:custom_bottombar/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_user_profil.dart';
import 'package:flutter/cupertino.dart';
import '../model/user.dart';
import 'water_bottle.dart';
import '../utils/globals.dart' as globals;

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
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomUserProfil(
            onClicked: () async {},
          ),
          const SizedBox(height: 14),
          buildName(user),
          const SizedBox(height: 100),
          buildPercentGoal(),
        ],
      ),
    );
  }

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
      width: 200,
      height: 200,
      child: WaterBottle(
          waterLevel: globals.percentDrinkedWater,
          waterColor: Colors.blue,
          bottleColor: Colors.lightBlue,
          capColor: Colors.blueGrey));
}
