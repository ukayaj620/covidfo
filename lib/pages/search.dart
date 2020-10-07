import 'package:covidfo/components/cov_card_country.dart';
import 'package:covidfo/components/cov_card_special.dart';
import 'package:covidfo/components/cov_text.dart';
import 'package:covidfo/components/cov_up_app_bar.dart';
import 'package:covidfo/constants/palette.dart';
import 'package:covidfo/models/single_country_summary_model.dart';
import 'package:covidfo/providers/country_summary_provider.dart';
import 'package:covidfo/providers/single_country_summary_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

CountrySummaryProvider country = CountrySummaryProvider();
SingleCountrySummaryProvider singleCountry = SingleCountrySummaryProvider();

class SearchPage extends StatefulWidget {
  static const String _id = 'search';

  static String get id => _id;

  @override
  _CreateSearchPage createState() => _CreateSearchPage();
}

class _CreateSearchPage extends State<SearchPage> {
  Future<List<SingleCountrySummaryModel>> futureListCountrySummary;
  Future<SingleCountrySummaryModel> futureSingleCountrySummary;

  List<SingleCountrySummaryModel> listCountrySummary = List();

  final TextEditingController _typeAheadController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureListCountrySummary = country.fetchCountriesDetailsSummary();
    futureListCountrySummary.then((value) => listCountrySummary = value).whenComplete(() => print(listCountrySummary));
  }

  List<String> _getSuggestions(List<SingleCountrySummaryModel> list, String query) {
    List<String> matches = List();

    for (var item in list) {
      matches.add(item.countryName);
    }

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    print(matches);
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CovUpAppBar(appBarText: 'Search'),
      body: SafeArea(
        child: Center(
          child: _searchContent(context, listCountrySummary),
        ),
      ),
    );
  }

  Widget _searchContent(BuildContext context, data) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 80.0,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: this._typeAheadController,
                  decoration: InputDecoration(
                    hintText: 'Type here country name',
                    hintStyle: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                    fillColor: Palette.backgroundColor,
                    filled: true,
                    contentPadding: EdgeInsets.all(20),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 24.0, right: 16.0),
                      child: Icon(
                        Icons.search,
                        color: Palette.textColor,
                        size: 32,
                      ),
                    ),
                  ),
                ),
                suggestionsCallback: (pattern) {
                  return _getSuggestions(listCountrySummary, pattern);
                },
                itemBuilder: (context, suggestion) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Palette.textColor)
                      )
                    ),
                    child: CovText(
                        textContent: suggestion,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        fontFamily: 'Roboto',
                        textAlign: TextAlign.start,
                        textColor: Palette.textColor,
                      ),
                  );
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: (suggestion) {
                  this._typeAheadController.text = suggestion;
                  setState(() {
                    futureSingleCountrySummary = singleCountry.fetchSingleCountrySummary(suggestion);
                  });
                },
              ),
            ),
            FutureBuilder(
              future: futureSingleCountrySummary,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return GestureDetector(
                    onDoubleTap: () {
                      futureSingleCountrySummary = singleCountry.fetchSingleCountrySummary(this._typeAheadController.text);
                      setState(() {});
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      alignment: Alignment.center,
                      child: Text("Double Tap To Reload"),
                    ),
                  );
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    return !snapshot.hasData
                      ? Text('No Data Found')
                      : CovCardSpecial(
                          imageUrl: snapshot.data.url,
                          cases: snapshot.data.totalConfirmed,
                          todayCases: snapshot.data.todayConfirmed,
                          recovered: snapshot.data.totalRecovered,
                          todayRecovered: snapshot.data.todayRecovered,
                          deaths: snapshot.data.totalDeaths,
                          todayDeaths: snapshot.data.todayDeaths,
                        );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}