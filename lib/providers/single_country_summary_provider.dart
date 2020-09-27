import 'package:covidfo/models/single_country_summary_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SingleCountrySummaryProvider {

  String _url = 'https://corona.lmao.ninja/v3/covid-19/countries';

  Future<SingleCountrySummaryModel> fetchSingleCountrySummary(String id) async {
    final response = await http.Client().get("$_url/$id", headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      return new SingleCountrySummaryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

}