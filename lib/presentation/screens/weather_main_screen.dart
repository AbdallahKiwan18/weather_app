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
      {'page': WeatherHomeScreen()},
      {'page': WeatherHomeScreen()},
      {'page': WeatherHomeScreen()},
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              WeatherHomeScreen(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarWidget());
  }


}
