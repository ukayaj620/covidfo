class GlobalSummaryModel {
  final int totalConfirmed;
  final int todayConfirmed;
  final int totalDeaths;
  final int todayDeaths;
  final int totalRecovered;
  final int todayRecovered;
  final DateTime date;

  GlobalSummaryModel({
    this.totalConfirmed,
    this.todayConfirmed,
    this.totalDeaths,
    this.todayDeaths,
    this.totalRecovered,
    this.todayRecovered,
    this.date
  });

  factory GlobalSummaryModel.fromJson(Map<String, dynamic> json) {
    return GlobalSummaryModel(
      totalConfirmed: json["cases"],
      todayConfirmed: json["todayCases"],
      totalDeaths: json["deaths"],
      todayDeaths: json["todayDeaths"],
      totalRecovered: json["recovered"],
      todayRecovered: json["todayRecovered"],
      date: DateTime.fromMillisecondsSinceEpoch(json["updated"]),
    );
  }
}