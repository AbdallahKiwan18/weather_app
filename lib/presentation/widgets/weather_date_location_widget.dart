import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/colors.dart';
import 'package:weather_app/core/utils/values_manger.dart';

class WeatherDateLocationWidget extends StatelessWidget {
  const WeatherDateLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppPadding.p24, horizontal: AppPadding.p5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sep 1/12/2025",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.s15,
                    color: AppColors.secondaryColor),
              ),
              SizedBox(height: AppSize.s4),
              Text(
                "Cairo",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: AppFontSize.s35,
                    ),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.location_on_outlined,
            size: AppSize.s30,
            color: AppColors.primaryColor,
          )
        ],
      ),
    );
  }
}
