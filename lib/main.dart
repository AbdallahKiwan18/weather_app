import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_app.dart';
import 'presentation/providers/weather_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<WeatherProvider>(
        create: (ctx) => WeatherProvider(),
      ),
    ],
    child: const WeatherApp(),
  ));
}
