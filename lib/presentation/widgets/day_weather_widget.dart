import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/utils/colors.dart';
import 'package:weather_app/core/utils/values_manger.dart';
import 'package:weather_app/presentation/providers/weather_provider.dart';

class DayWeatherWidget extends StatelessWidget {
  final int? index;

  const DayWeatherWidget({
    super.key,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(builder: (context, controller, _) {
      return Card(
        color: Colors.grey[270],
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppPadding.p20,
            horizontal: AppPadding.p15,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DateFormat().add_yMd().format(
                    DateTime.parse(controller.fiveDaysData[index!].dateTime!)),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(width: AppSize.s12),
              Text(
                DateFormat().add_jm().format(
                    DateTime.parse(controller.fiveDaysData[index!].dateTime!)),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(width: AppSize.s20),
              SizedBox(
                width: AppSize.s50,
                height: AppSize.s50,
                child: LottieBuilder.asset(controller
                    .getWeatherIcon(controller.fiveDaysData[index!].main)),
              ),
              SizedBox(width: AppSize.s7),
              Text(
                controller.fiveDaysData[index!].main ?? "",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppColors.primaryColor),
              ),
              const Spacer(),
              Text(
                (controller.fiveDaysData[index!].temp != null)
                    ? (controller.isFahrenheit)?
                "${controller.celsiusToFahrenheit((controller.fiveDaysData[index!].temp! - 273.15).round().toDouble())}\u2109"
                    :"${(controller.fiveDaysData[index!].temp! - 273.15).round().toString()}\u2103"
                    : "",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      );
    });
  }
}
