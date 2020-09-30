import 'package:covidfo/components/cov_card_country.dart';
import 'package:covidfo/components/cov_card_global.dart';
import 'package:covidfo/components/cov_card_special.dart';
import 'package:covidfo/components/cov_text.dart';
import 'package:covidfo/constants/palette.dart';
import 'package:covidfo/models/country_summary_model.dart';
import 'package:covidfo/models/global_summary_model.dart';
import 'package:covidfo/models/single_country_summary_model.dart';
import 'package:covidfo/providers/country_summary_provider.dart';
import 'package:covidfo/providers/global_summary_provider.dart';
import 'package:covidfo/providers/single_country_summary_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

GlobalSummaryProvider global = GlobalSummaryProvider();
CountrySummaryProvider country = CountrySummaryProvider();
SingleCountrySummaryProvider singleCountry = SingleCountrySummaryProvider();

class HomePage extends StatefulWidget {

  static const String _id = 'home';

  static String get id => _id;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<GlobalSummaryModel> futureGlobalSummary;
  Future<CountrySummaryModel> futureCountrySummary;
  Future<SingleCountrySummaryModel> futureSingleCountrySummary;
  DateFormat _dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  @override
  void initState() {
    super.initState();
    futureGlobalSummary = global.fetchGlobalSummary();
    futureCountrySummary = country.fetchCountrySummary();
    futureSingleCountrySummary = singleCountry.fetchSingleCountrySummary('IDN');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: Future.wait([
              futureGlobalSummary,
              futureCountrySummary,
              futureSingleCountrySummary
            ]),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasError) {
                return GestureDetector(
                  onDoubleTap: () {
                    futureGlobalSummary = global.fetchGlobalSummary();
                    futureCountrySummary = country.fetchCountrySummary();
                    futureSingleCountrySummary = singleCountry.fetchSingleCountrySummary('IDN');
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
      ),
    );
  }

  Widget _listOfContent(BuildContext context, data) {

    GlobalSummaryModel globalData = data[0];
    List<dynamic> countriesData = data[1].countries;
    SingleCountrySummaryModel singleCountryData = data[2];

    Future<void> _fetchData() async {
      setState(() {
        futureGlobalSummary = global.fetchGlobalSummary();
        futureCountrySummary = country.fetchCountrySummary();
        futureSingleCountrySummary = singleCountry.fetchSingleCountrySummary('IDN');
      });
    }

    return RefreshIndicator(
      onRefresh: _fetchData,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CovText(
                    textContent: 'Worldwide',
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
              padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0),
              width: double.infinity,
              child: CovText(
                textContent: singleCountryData.countryName,
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
                fontFamily: 'Quicksand',
                textAlign: TextAlign.start,
                textColor: Palette.textColor,
              ),
            ),
            CovCardSpecial(
              imageUrl: singleCountryData.url,
              cases: singleCountryData.totalConfirmed,
              todayCases: singleCountryData.todayConfirmed,
              recovered: singleCountryData.totalRecovered,
              todayRecovered: singleCountryData.todayRecovered,
              deaths: singleCountryData.totalDeaths,
              todayDeaths: singleCountryData.todayDeaths,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              width: double.infinity,
              child: CovText(
                textContent: 'Top 5 Most Infected Country',
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
                fontFamily: 'Quicksand',
                textAlign: TextAlign.start,
                textColor: Palette.textColor,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'detail', arguments: countriesData[index]),
                child: CovCountryCard(
                  imageUrl: countriesData[index]['countryInfo']['flag'],
                  cases: countriesData[index]['cases'],
                  todayCases: countriesData[index]['todayCases'],
                  recovered: countriesData[index]['recovered'],
                  todayRecovered: countriesData[index]['todayRecovered'],
                  deaths: countriesData[index]['deaths'],
                  todayDeaths: countriesData[index]['todayDeaths'],
                ),
              ),
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: countriesData.length == 0 ? null : 5,
            )
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
                "assets/icons/info.svg",
                width: 36.0,
              ),
              onPressed: () => Navigator.pushNamed(context, "about"),
            )
          ],
        ),
      ),
      backgroundColor: Palette.backgroundColor,
      elevation: 4.0,
    );
  }
}
