import 'package:covidfo/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'cov_text.dart';

class CovUpAppBar extends StatelessWidget with PreferredSizeWidget {

  final Size preferredSize;

  CovUpAppBar({
    this.appBarText,
  }) : preferredSize = Size.fromHeight(56.0);

  final String appBarText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Palette.backgroundColor,
      elevation: 4.0,
      title: Container(
        width: MediaQuery.of(context).size.width,
        color: Palette.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                  "assets/icons/arrow.svg",
                  width: 16.0,
                  height: 16.0
              ),
              onPressed: () => Navigator.pushNamed(context, "home"),
            ),
            SizedBox(
              width: 8.0,
            ),
            CovText(
              textContent: appBarText,
              fontWeight: FontWeight.w800,
              fontSize: 20.0,
              fontFamily: 'Quicksand',
              textAlign: TextAlign.start,
              textColor: Palette.textColor,
            ),
          ],
        ),
      ),
    );
  }
}