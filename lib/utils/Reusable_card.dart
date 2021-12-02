import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.onPressed, required this.colour, required this.cardChild});

  VoidCallback? onPressed;
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 150,
          margin: EdgeInsets.all(8.0),
          child: cardChild,
          decoration: BoxDecoration(
            color: colour,
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
        ));
  }
}
