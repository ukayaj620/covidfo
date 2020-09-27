class CountrySummaryModel {
  final List<dynamic> countries;

  CountrySummaryModel({
    this.countries
  });

  factory CountrySummaryModel.fromJson(List<dynamic> json) {
    return CountrySummaryModel(
      countries: json
    );
  }
}