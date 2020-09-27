import 'package:covidfo/components/cov_text.dart';
import 'package:covidfo/constants/palette.dart';
import 'package:flutter/material.dart';

class CovCountryCard extends StatelessWidget {

  CovCountryCard({
    this.imageUrl,
    this.cases,
    this.todayCases,
    this.recovered,
    this.todayRecovered,
    this.deaths,
    this.todayDeaths,
  });

  final String imageUrl;

  final int cases;
  final int todayCases;

  final int recovered;
  final int todayRecovered;

  final int deaths;
  final int todayDeaths;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      height: 120,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            spreadRadius: 0,
            blurRadius: 4, // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            imageUrl,
            height: 48.0,
            width: 72.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CovText(
                  textContent: "Cases: $cases [+$todayCases]",
                  textAlign: TextAlign.start,
                  fontFamily: 'Roboto',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.red[700],
                ),
                CovText(
                  textContent: "Recover: $recovered [+$todayRecovered]",
                  textAlign: TextAlign.start,
                  fontFamily: 'Roboto',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.green[700],
                ),
                CovText(
                  textContent: "Deaths: $deaths [+$todayDeaths]",
                  textAlign: TextAlign.start,
                  fontFamily: 'Roboto',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  textColor: Palette.textColor,
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}