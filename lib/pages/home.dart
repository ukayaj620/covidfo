import 'package:covidfo/components/cov_card_summary.dart';
import 'package:covidfo/components/cov_text.dart';
import 'package:covidfo/constants/palette.dart';
import 'package:covidfo/models/country_summary_model.dart';
import 'package:covidfo/models/global_summary_model.dart';
import 'package:covidfo/providers/country_summary_provider.dart';
import 'package:covidfo/providers/global_summary_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

GlobalSummaryProvider global = GlobalSummaryProvider();
CountrySummaryProvider country = CountrySummaryProvider();

class HomePage extends StatefulWidget {

  static const String _id = 'home';

  static String get id => _id;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<GlobalSummaryModel> futureGlobalSummary;
  Future<CountrySummaryModel> futureCountrySummary;
  DateFormat _dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  String _datetime = '';

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    setState(() {
      _datetime = _dateFormat.format(DateTime(now.year, now.month, now.day - 1));
    });
    futureGlobalSummary = global.fetchGlobalSummary();
    futureCountrySummary = country.fetchCountrySummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(
        child: FutureBuilder(
          future: Future.wait([futureGlobalSummary, futureCountrySummary]),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasError) {
              return GestureDetector(
                onDoubleTap: () {
                  futureGlobalSummary = global.fetchGlobalSummary();
                  futureCountrySummary = country.fetchCountrySummary();
                  setState(() {});
                },
                child: Text("${snapshot.error}")
              );
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                return !snapshot.hasData
                ? Text('No Data Found')
                :_listOfContent(context, snapshot.data);
            }
          },
        ),
      ),
    );
  }

  Widget _listOfContent(BuildContext context, data) {

    GlobalSummaryModel globalData = data[0];
    CountrySummaryModel countriesData = data[1];

    return RefreshIndicator(
      onRefresh: () {
        futureGlobalSummary = global.fetchGlobalSummary();
        futureCountrySummary = country.fetchCountrySummary();
        return;
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CovText(
                    textContent: 'Worlds',
                    fontWeight: FontWeight.w800,
                    fontSize: 20.0,
                    fontFamily: 'Quicksand',
                    textAlign: TextAlign.start,
                    textColor: Palette.textColor,
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                          color: Palette.primaryColor
                        ),
                        SizedBox(width: 2.0),
                        CovText(
                          textContent: _dateFormat.format(globalData.date),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          fontFamily: 'Roboto',
                          textAlign: TextAlign.end,
                          textColor: Colors.blue,
                        )
                      ],
                    ),
                  )
                ],
              )
            ),
            CovCardGlobal(
              textColor: Colors.red[700],
              cardText: 'Confirmed',
              iconPath: 'assets/icons/infected.svg',
              numberOfCovid: globalData.totalConfirmed,
            ),
            CovCardGlobal(
              textColor: Colors.green[700],
              cardText: 'Recovered',
              iconPath: 'assets/icons/healthy.svg',
              numberOfCovid: globalData.totalRecovered,
            ),
            CovCardGlobal(
              textColor: Colors.black54,
              cardText: 'Deaths',
              iconPath: 'assets/icons/deadly.svg',
              numberOfCovid: globalData.totalDeaths,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              width: double.infinity,
              child: CovText(
                textContent: 'Worlds',
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
                fontFamily: 'Quicksand',
                textAlign: TextAlign.start,
                textColor: Palette.textColor,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {

    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        width: MediaQuery.of(context).size.width,
        color: Palette.backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/covid19_app_bar.svg",
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/menu.svg",
              ),
              onPressed: () => print('Fly to about'),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 4.0,
    );
  }
}
