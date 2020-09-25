import 'package:flutter/material.dart';

class CovText extends StatelessWidget {

  const CovText({
    @required this.fontFamily,
    @required this.fontSize,
    @required this.fontWeight,
    @required this.textAlign,
    @required this.textContent,
    this.textColor = Colors.white,
  });

  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String textContent;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.textContent,
      textAlign: this.textAlign,
      style: TextStyle(
        color: textColor,
        fontFamily: this.fontFamily,
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
      ),
    );
  }
}