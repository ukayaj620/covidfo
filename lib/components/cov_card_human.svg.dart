import 'package:covidfo/components/cov_text.dart';
import 'package:covidfo/constants/palette.dart';
import 'package:flutter/material.dart';

class CovCardHuman extends StatelessWidget {

  CovCardHuman({
    this.name,
    this.studentId,
    this.imagePath,
  });

  final String name;
  final String studentId;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: 76,
            backgroundColor: Palette.primaryColor,
            child: CircleAvatar(
              radius: 72,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            child: CovText(
              textContent: name,
              fontWeight: FontWeight.w800,
              fontSize: 24.0,
              fontFamily: 'Quicksand',
              textAlign: TextAlign.start,
              textColor: Palette.textColor,
            ),
          ),
          CovText(
            textContent: studentId,
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            fontFamily: 'Roboto',
            textAlign: TextAlign.start,
            textColor: Palette.textColor,
          ),
        ],
      ),
    );
  }
}