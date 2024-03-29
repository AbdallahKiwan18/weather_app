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
  final TextEditingController searchController = TextEditingController();
  late final FocusNode focusNode = FocusNode();
  final DeBouncer _deBouncer = DeBouncer();
  List<FiveDayData> fiveDaysData = [];
  NetworkStatus? _networkStatus = NetworkStatus.loading;
  Position? currentPosition;
  bool isFahrenheit = false;

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
      WeatherRepository().getSearchWeatherData(
          city: searchCity,
          onSuccess: (data) {
            currentWeatherData = data;
            _city = searchCity;
            setStatus(NetworkStatus.success);
          },
          onError: (error) {
            if (searchCity == "" || searchCity == null) {
              _city = null;
              getCurrentWeatherData();
            }
            setStatus(NetworkStatus.error);
          });
    });
  }

  void getCurrentWeatherData() {
    setStatus(NetworkStatus.loading);
    WeatherRepository().getCurrentWeatherData(
        lat: _lat,
        lon: _lon,
        onSuccess: (data) {
          currentWeatherData = data;
          setStatus(NetworkStatus.success);
        },
        onError: (error) {
          setStatus(NetworkStatus.error);
        });
  }

  getFiveDaysData() {
    setStatus(NetworkStatus.loading);
    WeatherRepository().getFiveDaysForecastData(
        city: _city,
        lat: _lat,
        lon: _lon,
        isSearch: (_city == null) ? false : true,
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

  changeToFahrenheit(bool val) {
    isFahrenheit = val;
    notifyListeners();
  }

  double celsiusToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }
}
