import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/values_manger.dart';
import 'package:weather_app/presentation/widgets/text_with_underline_widget.dart';
import 'package:weather_app/presentation/widgets/day_weather_widget.dart';

class NextFiveDaysScreen extends StatelessWidget {
  const NextFiveDaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppPadding.p20,
        horizontal: AppPadding.p15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSize.s25),
          const TextWithUnderLineWidget(title: "Next Five Days"),
          SizedBox(height: AppSize.s30),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return const DayWeatherWidget();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: AppSize.s5);
                  },
                  itemCount: 5))
        ],
      ),
    );
  }
}
