import 'package:flutter/material.dart';
import '../utils/Reusable_card.dart';
import '../utils/constants.dart';

class AdviceScreen extends StatelessWidget {
  getAllAdvices(){

  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 28),
      children: <Widget>[
        BuildCard("Understand your fluid needs",
            "Before you decide to drink more water, you have to understand your body’s fluid needs."),
        BuildCard("Set a daily goal",
            "Setting a daily water intake goal can help you drink more water."),
        BuildCard("Keep a reusable water bottle with you",
            "Keeping a water bottle with you throughout the day can help you drink more water."),
        BuildCard(
            "Set reminders", "Keep using our application  on your smartphone."),
        BuildCard("Replace other drinks with water",
            "One way to drink more water — and boost your health and reduce your calorie intake — is to replace other drinks, such as soda and sports drinks, with water."),
        BuildCard("Drink one glass of water before each meal",
            "Another simple way to increase your water intake is to make a habit of drinking one glass of water before each meal."),
        BuildCard("Get a water filter",
            "In America, most tap water is safe to drink. However, if you have concerns about the quality or safety of your tap water, consider purchasing a water filter."),
        BuildCard("Flavor your water",
            "If you dislike the flavor of water, or just need a bit of flavor to help you drink more, you have many choices."),
        BuildCard("Drink one glass of water per hour at work",
            "If you work a standard 8-hour workday, drinking a glass of water each hour you’re at work adds up to 8 cups (1,920 ml) to your daily water intake."),
        BuildCard("Sip throughout the day",
            "Sipping on water consistently throughout the day is another easy way to help you meet your fluid goals."),
        BuildCard("Eat more foods high in water",
            "One simple way to get more water is to eat more foods that are high in water."),
        BuildCard("Drink one glass of water when you wake up and before bed",
            "An easy way to boost your water intake is to simply drink one glass when you wake up and another before you go to bed.")
      ],
    );
  }

  Widget BuildCard(title, subtitle) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child:
          Card(child: ListTile(title: Text(title,style:TextStyle(color: Colors.lightBlue) ,), subtitle: Text(subtitle))),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
