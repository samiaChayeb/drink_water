import 'dart:math';

import 'package:flutter/material.dart';
import '../utils/Icon_content.dart';
import '../utils/Reusable_card.dart';
import '../utils/constants.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Gender? selectedGender = Gender.Male;
  int height = 180;
  int weight = 40;
  int age = 15;
  String resultat = '0.00';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                SizedBox(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                          onPressed: () {
                            setState(() {
                              print('Male pressed');
                              selectedGender = Gender.Male;
                            });
                          },
                          colour: selectedGender == Gender.Male
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.mars,
                            label: "Male",
                          )),
                    ),
                    Expanded(
                      child: ReusableCard(
                          onPressed: () {
                            setState(() {
                              print('Female pressed');
                              selectedGender = Gender.Female;
                            });
                          },
                          colour: selectedGender == Gender.Female
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.venus,
                            label: "Female",
                          )),
                    ),
                  ],
                )),
                SizedBox(
                    child: Row(children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(height.toString(), style: kNumberTextStyle),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            overlayColor: Color(0x29EB1555),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 50.0,
                            max: 220.0,
                            activeColor: Colors.lightBlue,
                            inactiveColor: Color(0xff8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                                print(height);
                                waterNeeds();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  )),
                ])),
                SizedBox(
                    child: Row(children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                  waterNeeds();
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                  waterNeeds();
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                  waterNeeds();
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age > 0 ? age-- : 0;
                                  waterNeeds();
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ])),
                SizedBox(
                    child: ReusableCard(
                        colour: kActiveCardColor,
                        cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                this.resultat + " Litres",
                                style: kNumberTextStyle,
                              )
                            ])))
              ],
            )));
  }

  waterNeeds() {
    var female;
    if (this.selectedGender == Gender.Female)
      female = 1;
    else
      female = 0;
    this.resultat = (((this.age <= 3)
                ? (0.777 * (pow(this.weight, 0.83)))
                : ((this.age > 3 || this.age <= 13)
                    ? (0.0746 *
                        pow(0.95, female) *
                        (pow((this.height * this.weight), 0.65)))
                    : (0.0658 *
                       pow(0.84 ,female)*
                        (pow((this.height * this.weight), 0.69))))) /
            10)
        .toStringAsFixed(2);
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, color: Colors.lightBlue),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.white,
    );
  }
}
