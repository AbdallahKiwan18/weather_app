import 'package:weather_app/core/helpers/dio_helper.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/core/utils/endpoints.dart';
import 'package:weather_app/models/current_weather_data.dart';
import 'package:weather_app/models/five_days_data.dart';

class WeatherRepository {
  WeatherRepository();

  getSearchWeatherData({
    city,
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
    lat,
    lon,
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

  getFiveDaysForecastData({
    city,
    lat,
    lon,
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
