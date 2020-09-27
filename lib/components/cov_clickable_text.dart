import 'package:covidfo/components/cov_text.dart';
import 'package:flutter/material.dart';


class CovClickableText extends StatelessWidget {

  CovClickableText({
    @required this.onPressed,
    @required this.text,
    this.textColor = Colors.white
  });

  final Function onPressed;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.blue[100],
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      child: CovText(
        textContent: text,
        textAlign: TextAlign.center,
        fontFamily: 'Roboto',
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        textColor: textColor,
      ),
    );
  }
}