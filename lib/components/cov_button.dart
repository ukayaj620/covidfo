import 'package:flutter/material.dart';
import 'package:covidfo/components/cov_text.dart';


class CovButton extends StatelessWidget {

  CovButton({
    @required this.onPressed,
    @required this.color,
    @required this.buttonText,
    this.textColor = Colors.white
  });

  final Function onPressed;
  final Color color;
  final String buttonText;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(48),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              spreadRadius: 0,
              blurRadius: 8,
            )
          ]
        ),
        width: MediaQuery.of(context).size.width * .85,
        height: 48,
        child: Center(
          child: CovText(
            textContent: buttonText,
            textAlign: TextAlign.center,
            fontFamily: 'Quicksand',
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            textColor: textColor,
          ),
        ),
      ),
    );
  }
}