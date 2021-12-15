import 'package:custom_bottombar/screens/advice_screen.dart';
import 'package:custom_bottombar/screens/profil_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const splashPage = '/';
  static const testPage = '/test';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    switch (settings.name) {
      case testPage:
        return MaterialPageRoute(builder: (_) => AdviceScreen());
      case splashPage:
        return MaterialPageRoute(builder: (_) => ProfilScreen());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
