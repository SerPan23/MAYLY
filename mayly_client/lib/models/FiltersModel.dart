class Filters {
  String? startDate, endDate, place;

  Filters({
    this.startDate,
    this.endDate,
    this.place,
  });

  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate,
      'endDate': endDate,
      'place': place,
    };
  }
}
