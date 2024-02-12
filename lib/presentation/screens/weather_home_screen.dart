import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/values_manger.dart';
import 'package:weather_app/presentation/widgets/custom_text_field_widget.dart';
import 'package:weather_app/presentation/widgets/weather_card_widget.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppPadding.p15, horizontal: AppPadding.p15),
      child: Column(
        children: [
          SizedBox(height: AppSize.s50),
          CustomTextFieldWidget(
              ctrl: _searchController,
              suffixIcon: Icons.search,
              text: "Search"),
          const WeatherCardWidget()
        ],
      ),
    );
  }
}
