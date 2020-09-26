import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {

  static const String _id = 'home';

  static String get id => _id;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        "assets/icons/covid19_app_bar.svg",
        width: MediaQuery.of(context).size.width * 0.36,
      ),
      backgroundColor: Colors.white,
      elevation: 4.0,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/menu.svg",
          ),
          onPressed: () => print('Fly to about'),
        )
      ],
    );
  }
}