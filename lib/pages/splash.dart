import 'package:covidfo/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class Splash extends StatefulWidget {

  static const String _id = 'splash';

  static String get id => _id;

  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    startSplash();
  }

  startSplash() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, () => Navigator.pushNamed(context, 'intro'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Center(
        child: SvgPicture.asset(
          'assets/icons/covid19_app_bar.svg',
          height: 64.0,
        ),
      ),
    );
  }
}