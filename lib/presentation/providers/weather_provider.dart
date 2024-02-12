import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_images.dart';
import 'package:weather_app/core/utils/network_status.dart';
import 'package:weather_app/models/current_weather_data.dart';
import 'package:weather_app/models/five_days_data.dart';
import 'package:weather_app/repositories/weather_repository.dart';

class WeatherProvider with ChangeNotifier {
  String? city = "cairo";
  dynamic lat = 30.033333;
  dynamic lon = 31.233334;
  String? searchText;
  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];
  NetworkStatus? _networkStatus = NetworkStatus.start;

  setStatus(NetworkStatus networkStatus) {
    _networkStatus = networkStatus;
    notifyListeners();
  }

  NetworkStatus? getStatus() => _networkStatus;

  updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void getSearchWeatherData() {
    setStatus(NetworkStatus.loading);
    WeatherRepository(city: '$city').getSearchWeatherData(onSuccess: (data) {
      currentWeatherData = data;
      setStatus(NetworkStatus.success);
    }, onError: (error) {
      setStatus(NetworkStatus.error);
    });
  }

  void getCurrentWeatherData() {
    setStatus(NetworkStatus.loading);
    WeatherRepository(
      lat: lat,
      lon: lon,
    ).getCurrentWeatherData(onSuccess: (data) {
      currentWeatherData = data;
      setStatus(NetworkStatus.success);
    }, onError: (error) {
      setStatus(NetworkStatus.error);
    });
  }

  void getFiveDaysData() {
    setStatus(NetworkStatus.loading);
    WeatherRepository(city: '$city').getFiveDaysForecastData(onSuccess: (data) {
      fiveDaysData = data;
      setStatus(NetworkStatus.success);
    }, onError: (error) {
      setStatus(NetworkStatus.error);
    });
  }

  getWeatherIcon(weatherType) {
    switch (weatherType) {
      case "Clouds":
        return Images.cloud;
      case "Rain":
        return Images.rain;
      case "overcast clouds":
        return Images.snow;
      case "Clear":
        return Images.sunny;
      default:
        return Images.sunny; // Default icon if weather type is unknown
    }
  }
}
