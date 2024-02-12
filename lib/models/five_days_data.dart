class FiveDayData {
  final String? dateTime;
  final dynamic temp;
  final String? main;

  FiveDayData({
    this.main,
    this.dateTime,
    this.temp,
  });

  factory FiveDayData.fromJson(dynamic json) {
    if (json == null) {
      return FiveDayData();
    }
    return FiveDayData(
      dateTime: json['dt_txt'],
      temp: json['main']['temp'],
      main: json['weather'][0]['main'],
    );
  }
}
