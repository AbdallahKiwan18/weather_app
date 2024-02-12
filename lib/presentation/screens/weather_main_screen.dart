import 'package:flutter/material.dart';
import 'package:weather_app/presentation/screens/weather_home_screen.dart';
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
      {'page': Container()},
      {'page': Container()},
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
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }
}
