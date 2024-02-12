import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/app_images.dart';
import 'package:weather_app/core/utils/colors.dart';
import 'package:weather_app/core/utils/values_manger.dart';

class DayWeatherWidget extends StatelessWidget {
  const DayWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              "sat",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(width: AppSize.s10),
            Text(
              "1/1/2022",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(width: AppSize.s30),
            SizedBox(
              width: AppSize.s50,
              height: AppSize.s50,
              child: LottieBuilder.asset(Images.sunny),
            ),
            SizedBox(width: AppSize.s7),
            Text(
              "sunny",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: AppColors.primaryColor),
            ),
            const Spacer(),
            Text(
              "7 C",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
