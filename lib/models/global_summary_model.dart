class GlobalSummaryModel {
  final int totalConfirmed;
  final int totalDeaths;
  final int totalRecovered;
  final DateTime date;

  GlobalSummaryModel({
    this.totalConfirmed,
    this.totalDeaths,
    this.totalRecovered,
    this.date
  });

  factory GlobalSummaryModel.fromJson(Map<String, dynamic> json) {
    return GlobalSummaryModel(
      totalConfirmed: json["confirmed"]["value"],
      totalDeaths: json["deaths"]["value"],
      totalRecovered: json["recovered"]["value"],
      date: DateTime.parse(json["lastUpdate"]),
    );
  }
}