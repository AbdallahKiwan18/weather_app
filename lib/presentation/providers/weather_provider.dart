import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/helpers/debouncer.dart';
import 'package:weather_app/core/helpers/functions.dart';
import 'package:weather_app/core/utils/app_images.dart';
import 'package:weather_app/core/utils/network_status.dart';
import 'package:weather_app/models/current_weather_data.dart';
import 'package:weather_app/models/five_days_data.dart';
import 'package:weather_app/repositories/weather_repository.dart';

class WeatherProvider with ChangeNotifier {
  String? _city;
  dynamic _lat;
  dynamic _lon;
  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  final DeBouncer _deBouncer = DeBouncer();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];
  NetworkStatus? _networkStatus = NetworkStatus.loading;
  Position? currentPosition;

  setStatus(NetworkStatus networkStatus) {
    _networkStatus = networkStatus;
    notifyListeners();
  }

  NetworkStatus? getStatus() => _networkStatus;

  updateWeather() {
    getCurrentWeatherData();
  }

  void getSearchWeatherData(searchCity) {
    setStatus(NetworkStatus.loading);
    _deBouncer.run(() {
      WeatherRepository(city: searchCity).getSearchWeatherData(
          onSuccess: (data) {
        currentWeatherData = data;
        _city = searchCity;
        setStatus(NetworkStatus.success);
      }, onError: (error) {
        if (searchCity == "" || searchCity == null ) {
          _city = "";
          getCurrentWeatherData();
        }
        setStatus(NetworkStatus.error);
      });
    });
  }

  void getCurrentWeatherData() {
    setStatus(NetworkStatus.loading);
    WeatherRepository(
      lat: _lat,
      lon: _lon,
    ).getCurrentWeatherData(onSuccess: (data) {
      currentWeatherData = data;
      setStatus(NetworkStatus.success);
    }, onError: (error) {
      setStatus(NetworkStatus.error);
    });
  }

  getFiveDaysData() {
    setStatus(NetworkStatus.loading);
    WeatherRepository(
      city: '$_city',
      lat: _lat,
      lon: _lon,
    ).getFiveDaysForecastData(
        isSearch: (_city != null) ? true : false,
        onSuccess: (data) {
          fiveDaysData = data;
          setStatus(NetworkStatus.success);
        },
        onError: (error) {
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

  getCurrentLocation(context) async {
    LocationPermission permission;

    await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return showCustomDialog(context);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return showCustomDialog(context);
    }
    return await Geolocator.getCurrentPosition().then((Position value) {
      currentPosition = value;
      _lat = currentPosition!.latitude;
      _lon = currentPosition!.longitude;
      notifyListeners();
    });
  }
}
