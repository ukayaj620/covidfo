import 'package:covidfo/components/cov_card_human.svg.dart';
import 'package:covidfo/components/cov_text.dart';
import 'package:covidfo/components/cov_up_app_bar.dart';
import 'package:covidfo/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutPage extends StatelessWidget {

  static const String _id = 'about';

  static String get id => _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CovUpAppBar(appBarText: 'About'),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),
          width: MediaQuery.of(context).size.width,
          color: Palette.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/covid19_app_bar.svg',
                width: MediaQuery.of(context).size.width * 0.75,
              ),
              SizedBox(
                height: 16.0,
              ),
              CovText(
                textContent: 'What is it?',
                textAlign: TextAlign.center,
                fontFamily: 'Quicksand',
                fontSize: 24.0,
                fontWeight: FontWeight.w900,
                textColor: Palette.textColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: CovText(
                  textContent: 'Covidfo is a mobile application to provide information of COVID-19, '
                      'provided from Worldometer, John Hopkins University, and more.\n'
                      'During this pandemic, it is important to keep track of COVID-19 information.',
                  textAlign: TextAlign.justify,
                  fontFamily: 'Roboto',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  textColor: Palette.textColor,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}