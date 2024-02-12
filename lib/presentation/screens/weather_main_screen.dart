import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/providers/weather_provider.dart';
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
  WeatherProvider? weatherProvider;



  @override
  void initState() {
    weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await weatherProvider?.updateWeather();
    });
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
