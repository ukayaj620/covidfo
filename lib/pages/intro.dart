import 'package:covidfo/components/cov_button.dart';
import 'package:flutter/material.dart';
import 'package:covidfo/constants/palette.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covidfo/components/cov_text.dart';

class IntroPage extends StatelessWidget {

  static const String _id = 'intro';

  static String get id => _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Palette.backgroundColor,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: SvgPicture.asset(
                  "assets/images/covid19_new.svg",
                  width: MediaQuery.of(context).size.width * 0.75,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: CovText(
                  textContent: 'Keep your COVID-19 Information up to date',
                  textAlign: TextAlign.center,
                  fontFamily: 'Quicksand',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                  textColor: Colors.black87,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: CovText(
                  textContent: 'We provide a real time data of COVID-19 all around the world',
                  textAlign: TextAlign.center,
                  fontFamily: 'Roboto',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                  textColor: Colors.black87,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                child: CovButton(
                  onPressed: () => Navigator.pushNamed(context, 'login'),
                  color: Palette.primaryColor,
                  buttonText: 'Get Started',
                ),
              ),
            ],
          )
        )
      )
    );
  }
}
