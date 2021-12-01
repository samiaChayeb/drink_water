import 'package:flutter/material.dart';

import '../clipper/wave_clipper.dart';
import 'custom_nav_item.dart';
import '../main.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  setPage() {
    setState(() {
      pageController.jumpToPage(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).primaryColor.withAlpha(150),
                        Theme.of(context).primaryColor,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 45,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomNavItem(
                      setPage: setPage, icon: Icons.person, id: 0),
                  Container(),
                  CustomNavItem(setPage: setPage, icon: Icons.music_note, id: 1),
                  Container(),
                  CustomNavItem(
                      setPage: setPage, icon: Icons.message, id: 2),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Profil',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                    ),
                  ),
                  Container(),
                  Text(
                    'Sounds',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                  Container(),
                  Text(
                    'Advice',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
