import 'package:covidfo/components/cov_text.dart';
import 'package:covidfo/constants/palette.dart';
import 'package:flutter/material.dart';

RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function matchFunc = (Match match) => '${match[1]}.';

class CovCardSpecial extends StatelessWidget {

  CovCardSpecial({
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
        padding: EdgeInsets.symmetric(vertical: 12.0),
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
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
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Image.network(imageUrl)
            ),
            SizedBox(
              height: 20.0,
            ),
            CovText(
              textContent: 'Infected',
              textAlign: TextAlign.center,
              fontFamily: 'Quicksand',
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              textColor: Palette.textColor,
            ),
            CovText(
              textContent: "${cases.toString().replaceAllMapped(reg, matchFunc)} "
                  " [+${todayCases.toString().replaceAllMapped(reg, matchFunc)}]",
              textAlign: TextAlign.center,
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              textColor: Colors.red[700],
            ),
            SizedBox(
              height: 20.0,
            ),
            CovText(
              textContent: 'Recovered',
              textAlign: TextAlign.center,
              fontFamily: 'Quicksand',
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              textColor: Palette.textColor,
            ),
            CovText(
              textContent: "${recovered.toString().replaceAllMapped(reg, matchFunc)} "
                  " [+${todayRecovered.toString().replaceAllMapped(reg, matchFunc)}]",
              textAlign: TextAlign.center,
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              textColor: Colors.green[700],
            ),
            SizedBox(
              height: 20.0,
            ),
            CovText(
              textContent: 'Deaths',
              textAlign: TextAlign.center,
              fontFamily: 'Quicksand',
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              textColor: Palette.textColor,
            ),
            CovText(
              textContent: "${deaths.toString().replaceAllMapped(reg, matchFunc)} "
                  " [+${todayDeaths.toString().replaceAllMapped(reg, matchFunc)}]",
              textAlign: TextAlign.center,
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              textColor: Colors.black54,
            ),
          ],
        )
    );
  }
}