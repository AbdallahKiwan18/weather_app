import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/utils/colors.dart';
import 'package:weather_app/core/utils/values_manger.dart';
import 'package:weather_app/presentation/providers/weather_provider.dart';
import 'package:weather_app/presentation/widgets/weather_date_location_widget.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(builder: (context, controller, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WeatherDateLocationWidget(),
          Center(
            child: SizedBox(
              width: AppSize.s250,
              height: AppSize.s300,
              child: LottieBuilder.asset(controller.getWeatherIcon(
                  controller.currentWeatherData.weather?[0].main
              )),
            ),
          ),
          Text(
            (controller.currentWeatherData.main?.temp != null)
                ? (controller.isFahrenheit)?
            "${controller.celsiusToFahrenheit((controller.currentWeatherData.main!.temp! - 273.15).round().toDouble())}\u2109"
                :"${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103"
                : "",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.s70,
                ),
          ),
          Text(
            controller.currentWeatherData.weather?[0].main ?? "",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  fontSize: AppFontSize.s30,
                ),
          ),
        ],
      );
    });
  }
}
