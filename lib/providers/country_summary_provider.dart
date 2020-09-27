import 'package:covidfo/models/country_summary_model.dart';
import 'package:covidfo/models/single_country_summary_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountrySummaryProvider {

  String _url = 'https://corona.lmao.ninja/v3/covid-19/countries?sort=cases';

  Future<CountrySummaryModel> fetchCountrySummary() async {
    final response = await http.Client().get(_url, headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      return new CountrySummaryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

  Future<List<SingleCountrySummaryModel>> fetchCountriesDetailsSummary() async {
    final response = await http.Client().get(_url, headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      List<SingleCountrySummaryModel> countries =  (json.decode(response.body) as List).map((country) => new SingleCountrySummaryModel.fromJson(country)).toList();
      print(countries);
      return countries;
    } else {
      throw Exception();
    }
  }
}