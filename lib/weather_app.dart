import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/colors.dart';
import 'package:weather_app/presentation/screens/weather_main_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          title: 'Weather App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            useMaterial3: true,
          ),
          home: const WeatherMainScreen(),
        );
      },
    );
  }
}
