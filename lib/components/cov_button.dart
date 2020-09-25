import 'package:flutter/material.dart';
import 'package:covidfo/components/cov_text.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CovButton extends StatelessWidget {

  CovButton({
    @required this.onPressed,
    @required this.color,
    @required this.buttonText,
    this.icon = false,
    this.textColor = Colors.white
  });

  final Function onPressed;
  final Color color;
  final String buttonText;
  final Color textColor;
  final bool icon;

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
        padding: EdgeInsets.symmetric(vertical: icon ? 8.0 : 12.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _isIconButton(),
          ),
        ),
      ),
    );
  }

  List<Widget> _isIconButton() {
    return
      icon ?
        <Widget>[
          SvgPicture.asset(
              'assets/icons/google.svg',
              height: 36
          ),
          SizedBox(
            width: 20.0,
          ),
          CovText(
            textContent: buttonText,
            textAlign: TextAlign.center,
            fontFamily: 'Quicksand',
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            textColor: textColor,
          ),
        ]
      : <Widget>[
        CovText(
          textContent: buttonText,
          textAlign: TextAlign.center,
          fontFamily: 'Quicksand',
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          textColor: textColor,
        ),
      ];
  }
}