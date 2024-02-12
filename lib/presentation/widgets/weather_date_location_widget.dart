import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/utils/colors.dart';
import 'package:weather_app/core/utils/values_manger.dart';
import 'package:weather_app/presentation/providers/weather_provider.dart';

class WeatherDateLocationWidget extends StatelessWidget {
  const WeatherDateLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context,controller,_) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppPadding.p24, horizontal: AppPadding.p5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat()
                          .add_MMMMEEEEd()
                          .format(DateTime.now()),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSize.s15,
                          color: AppColors.secondaryColor),
                    ),
                    SizedBox(height: AppSize.s4),
                    Text(
                      controller.currentWeatherData.name??"",
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: AppFontSize.s35,
                          ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.location_on_outlined,
                size: AppSize.s30,
                color: AppColors.primaryColor,
              )
            ],
          ),
        );
      }
    );
  }
}
