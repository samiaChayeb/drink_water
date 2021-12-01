import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/Reusable_card.dart';
import '../utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/Icon_content.dart';

class ProfilScreen extends StatefulWidget {

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilScreen>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  Gender? selectedGender = Gender.Male;
  int height = 180;
  int weight = 40;
  int age = 15;

  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
        Column(
        children: <Widget>[
          new Container(
          height: 250.0,
          color: Colors.white,
          child: new Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 20.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 22.0,
                      ),
                    ],
                  )),
              new Container(
                  child:
                  new Stack(fit: StackFit.loose, children: <Widget>[
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                            width: 140.0,
                            height: 140.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                image:
                                new ExactAssetImage('assets/welcome.jpg'),
                                fit: BoxFit.cover,
                              ),
                            )),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 90.0, right: 100.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 25.0,
                              child: new Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )),
                  ])),
            ],
          ),
        ),
        new Container(
          color: Color(0xffFFFFFF),
          child: Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 25.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[],
                        ),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'eeeee',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'eeeee',
                              style: TextStyle(color: Colors.grey),
                            ),
                            _status ? _getEditIcon() : new Container(),
                          ],
                        )
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 25.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[],
                        ),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[],
                        )
                      ],
                    )),
                !_status ? _getActionButtons() : new Container(),
              ],
            ),
          ),
        )
        ],
      ),
      Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    onPressed: () {
                      setState(() {
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
      Expanded(
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
                          min: 120.0,
                          max: 220.0,
                          activeColor: Color(0xffEB1555),
                          inactiveColor: Color(0xff8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                )),
          ])),
      Expanded(
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
                                age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ])),
      ],
    ),)
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }

  Widget getWidget(bool showOtherGender, bool alignVertical) {
    return GenderPickerWithImage(
      showOtherGender: showOtherGender,
      verticalAlignedText: alignVertical,
      // to show what's selected on app opens, but by default it's Male
      selectedGender: this.selectedGender,
      selectedGenderTextStyle:
      TextStyle(color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
      unSelectedGenderTextStyle:
      TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
      onChanged: (Gender? gender) {
        this.selectedGender = gender;
      },
      //Alignment between icons
      equallyAligned: true,
      animationDuration: Duration(milliseconds: 300),
      isCircular: true,
      // default : true,
      opacityOfGradient: 0.4,
      padding: const EdgeInsets.all(3),
      size: 50, //default : 40
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5E),
    );
  }
}