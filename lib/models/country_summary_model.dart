class CountrySummaryModel {
  final List<dynamic> Countries;

  CountrySummaryModel({
    this.Countries
  });

  factory CountrySummaryModel.fromJson(List<dynamic> json) {
    return CountrySummaryModel(
      Countries: json
    );
  }
}