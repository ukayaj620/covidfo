import 'package:covidfo/models/global_summary_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GlobalSummaryProvider {

  String _url = 'https://corona.lmao.ninja/v3/covid-19/all';

  Future<GlobalSummaryModel> fetchGlobalSummary() async {
    final response = await http.Client().get(_url, headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      return new GlobalSummaryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

}