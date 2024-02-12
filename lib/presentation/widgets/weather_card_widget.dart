import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/app_images.dart';
import 'package:weather_app/core/utils/colors.dart';
import 'package:weather_app/core/utils/values_manger.dart';
import 'package:weather_app/presentation/widgets/weather_date_location_widget.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WeatherDateLocationWidget(),
        Center(
          child: SizedBox(
            width: AppSize.s250,
            height: AppSize.s300,
            child: LottieBuilder.asset(Images.sunny),
          ),
        ),
        Text(
          "26",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.s70,
              ),
        ),
        Text(
          "Sunny",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                fontSize: AppFontSize.s30,
              ),
        ),
      ],
    );
  }
}
