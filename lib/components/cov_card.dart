import 'package:covidfo/components/cov_text.dart';
import 'package:covidfo/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function matchFunc = (Match match) => '${match[1]}.';

class CovCard extends StatelessWidget {

  CovCard({
    this.iconPath,
    this.textColor,
    this.cardText,
    this.numberOfCovid,
  });

  final Color textColor;
  final String iconPath;
  final String cardText;
  final int numberOfCovid;

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CovText(
                textContent: cardText,
                textAlign: TextAlign.center,
                fontFamily: 'Quicksand',
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                textColor: Palette.textColor,
              ),
              CovText(
                textContent: numberOfCovid.toString().replaceAllMapped(reg, matchFunc),
                textAlign: TextAlign.center,
                fontFamily: 'Roboto',
                fontSize: 32.0,
                fontWeight: FontWeight.w400,
                textColor: textColor,
              ),
            ],
          ),
          SvgPicture.asset(
            iconPath,
            height: 72.0,
          ),
        ],
      ),
    );
  }
}