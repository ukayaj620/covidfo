import 'package:covidfo/components/cov_card_global.dart';
import 'package:covidfo/components/cov_text.dart';
import 'package:covidfo/components/cov_up_app_bar.dart';
import 'package:covidfo/constants/palette.dart';
import 'package:flutter/material.dart';

class DetailCountryPage extends StatelessWidget {

  static const String _id = 'detail';

  static String get id => _id;

  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: CovUpAppBar(
        appBarText: "Details",
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CovText(
                  textContent: args['country'],
                  textAlign: TextAlign.start,
                  fontFamily: 'Quicksand',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                  textColor: Palette.textColor,
                ),// changes position of shadow,
                Container(
                  height: 200,
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
                  child: Image.network(args['countryInfo']['flag'])
                ),
                CovCardGlobal(
                  textColor: Colors.red[700],
                  cardText: 'Confirmed',
                  iconPath: 'assets/icons/infected.svg',
                  numberOfCovid: args['cases'],
                ),
                CovCardGlobal(
                  textColor: Colors.green[700],
                  cardText: 'Recovered',
                  iconPath: 'assets/icons/healthy.svg',
                  numberOfCovid: args['recovered'],
                ),
                CovCardGlobal(
                  textColor: Colors.black54,
                  cardText: 'Deaths',
                  iconPath: 'assets/icons/deadly.svg',
                  numberOfCovid: args['deaths'],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}