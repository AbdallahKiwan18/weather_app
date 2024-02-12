import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/network_status.dart';
import 'package:weather_app/models/current_weather_data.dart';
import 'package:weather_app/models/five_days_data.dart';
import 'package:weather_app/repositories/weather_repository.dart';

class WeatherProvider with ChangeNotifier {
  String? city;
  dynamic lat;
  dynamic lon;
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
    WeatherRepository(city: '$city').getSearchWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          setStatus(NetworkStatus.success);
        },
        onError: (error) => {
              setStatus(NetworkStatus.error),
            });
  }

  void getCurrentWeatherData() {
    setStatus(NetworkStatus.loading);
    WeatherRepository(
      lat: lat,
      lon: lon,
    ).getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          setStatus(NetworkStatus.success);
        },
        onError: (error) => {
              setStatus(NetworkStatus.error),
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
}
