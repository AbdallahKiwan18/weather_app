import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widgets/custom_text_field_widget.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomTextFieldWidget(ctrl: _searchController,text: "Search"),
      ],
    );
  }
}
