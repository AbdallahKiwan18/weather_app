import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/colors.dart';
import 'package:weather_app/core/utils/values_manger.dart';
import 'package:weather_app/presentation/screens/next_five_days_screen.dart';
import 'package:weather_app/presentation/screens/weather_home_screen.dart';
import 'package:weather_app/presentation/screens/weather_setting_screen.dart';
import 'package:weather_app/presentation/widgets/bottom_navigation_widget.dart';

class WeatherMainScreen extends StatefulWidget {
  const WeatherMainScreen({super.key});

  @override
  State<WeatherMainScreen> createState() => _WeatherMainScreenState();
}

class _WeatherMainScreenState extends State<WeatherMainScreen> {
  List<Map<String, Object>>? _pages;
  int selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': const WeatherHomeScreen()},
      {'page': const NextFiveDaysScreen()},
      {'page': const WeatherSettingScreen()},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages![selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBarWidget(
        index: selectedPageIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }
}
