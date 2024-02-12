import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/app_images.dart';
import 'package:weather_app/presentation/widgets/weather_date_location_widget.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WeatherDateLocationWidget(),
        SizedBox(
          width: 120,
          height: 120,
          child: LottieBuilder.asset(
              Images.snow),
        ),
      ],
    );
  }
}
