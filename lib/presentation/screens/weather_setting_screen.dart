import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/values_manger.dart';
import 'package:weather_app/presentation/widgets/text_with_underline_widget.dart';

class WeatherSettingScreen extends StatelessWidget {
  const WeatherSettingScreen({super.key});

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
          const TextWithUnderLineWidget(title: "Settings"),
          SizedBox(height: AppSize.s30),
          Center(
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Use Fahrenheit",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onChanged: (val) {},
              value: true,
            ),
          )
        ],
      ),
    );
  }
}
