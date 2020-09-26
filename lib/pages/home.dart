import 'package:covidfo/components/cov_card.dart';
import 'package:covidfo/constants/palette.dart';
import 'package:covidfo/models/global_summary_model.dart';
import 'package:covidfo/providers/global_summary_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

GlobalSummaryProvider global = GlobalSummaryProvider();

class HomePage extends StatefulWidget {

  static const String _id = 'home';

  static String get id => _id;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<GlobalSummaryModel> futureGlobalSummary;
  DateFormat fn = DateFormat("M-dd-yyyy");
  String datetime = '';

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    setState(() {
      datetime = fn.format(DateTime(now.year, now.month, now.day - 1));
    });
    futureGlobalSummary = global.fetchGlobalSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(
        child: FutureBuilder<GlobalSummaryModel>(
          future: futureGlobalSummary,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text('Waiting');
              default:
                return !snapshot.hasData
                ? CircularProgressIndicator()
                : _listOfContent(context, snapshot.data);
            }
          },
        ),
      ),
    );
  }

  Widget _listOfContent(BuildContext context, GlobalSummaryModel data) {

    return RefreshIndicator(
      onRefresh: () => futureGlobalSummary = global.fetchGlobalSummary(),
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
        children: <Widget>[
          CovCard(
            textColor: Colors.red[700],
            cardText: 'Confirmed',
            iconPath: 'assets/icons/covid19.svg',
            numberOfCovid: data.totalConfirmed,
          ),
          CovCard(
            textColor: Colors.green[700],
            cardText: 'Recovered',
            iconPath: 'assets/icons/covid19.svg',
            numberOfCovid: data.totalRecovered,
          ),
          CovCard(
            textColor: Colors.black54,
            cardText: 'Deaths',
            iconPath: 'assets/icons/covid19.svg',
            numberOfCovid: data.totalDeaths,
          ),
        ],
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
              width: MediaQuery.of(context).size.width * 0.36,
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
