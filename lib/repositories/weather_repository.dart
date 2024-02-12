import 'package:weather_app/core/helpers/dio_helper.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/core/utils/endpoints.dart';
import 'package:weather_app/models/current_weather_data.dart';
import 'package:weather_app/models/five_days_data.dart';

class WeatherRepository {
  final String? city;
  final dynamic lat;
  final dynamic lon;

  WeatherRepository({
    this.lat,
    this.lon,
    this.city,
  });

  void getSearchWeatherData({
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '${Endpoints.baseUrl}/weather?q=$city&lang=en&$apiKey';
    DioHelper(
      url: url,
    ).get(
        onSuccess: (data) => {
              onSuccess!(CurrentWeatherData.fromJson(data)),
            },
        onError: (error) => {
              if (onError != null)
                {
                  onError(error),
                }
            });
  }

  void getCurrentWeatherData({
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url =
        '${Endpoints.baseUrl}/weather?lat=$lat&lon=$lon&lang=en&$apiKey';
    DioHelper(
      url: url,
    ).get(
        onSuccess: (data) => {
              onSuccess!(CurrentWeatherData.fromJson(data)),
            },
        onError: (error) => {
              if (onError != null)
                {
                  onError(error),
                }
            });
  }

  void getFiveDaysForecastData({
    Function(List<FiveDayData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
    bool isSearch = false,
  }) {
    final url = (isSearch)
        ? '${Endpoints.baseUrl}/forecast?&q=$city&lang=en&$apiKey'
        : '${Endpoints.baseUrl}/forecast?lat=$lat&lon=$lon&lang=en&$apiKey';
    DioHelper(
      url: url,
    ).get(
        onSuccess: (data) => {
              onSuccess!((data['list'] as List)
                  .map((t) => FiveDayData.fromJson(t))
                  .toList())
            },
        onError: (error) => {
              onError!(error),
            });
  }
}
