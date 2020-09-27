class SingleCountrySummaryModel {
  final int totalConfirmed;
  final int todayConfirmed;
  final int totalDeaths;
  final int todayDeaths;
  final int totalRecovered;
  final int todayRecovered;
  final String countryName;
  final String url;

  SingleCountrySummaryModel({
    this.totalConfirmed,
    this.todayConfirmed,
    this.totalDeaths,
    this.todayDeaths,
    this.totalRecovered,
    this.todayRecovered,
    this.countryName,
    this.url
  });

  factory SingleCountrySummaryModel.fromJson(Map<String, dynamic> json) {
    return SingleCountrySummaryModel(
      totalConfirmed: json["cases"],
      todayConfirmed: json["todayCases"],
      totalDeaths: json["deaths"],
      todayDeaths: json["todayDeaths"],
      totalRecovered: json["recovered"],
      todayRecovered: json["todayRecovered"],
      countryName: json["country"],
      url: json["countryInfo"]["flag"],
    );
  }
}