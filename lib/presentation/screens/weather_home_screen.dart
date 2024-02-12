import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/utils/network_status.dart';
import 'package:weather_app/core/utils/values_manger.dart';
import 'package:weather_app/presentation/providers/weather_provider.dart';
import 'package:weather_app/presentation/widgets/custom_text_field_widget.dart';
import 'package:weather_app/presentation/widgets/loading_widget.dart';
import 'package:weather_app/presentation/widgets/weather_card_widget.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(builder: (context, controller, _) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppPadding.p15, horizontal: AppPadding.p24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.s50),
              CustomTextFieldWidget(
                  fieldSubmit: (val) {
                    controller.getSearchWeatherData(controller.searchController.text);
                  },
                  focus: controller.focusNode,
                  ctrl: controller.searchController,
                  suffixIcon: Icons.search,
                  text: "Search"),
              (controller.getStatus() == NetworkStatus.loading)
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: const Center(child: LoadingWidget()))
                  : (controller.getStatus() == NetworkStatus.error &&
                  controller.searchController.text.isNotEmpty)
                      ? const Center(
                          child: Text("Location is not correct"),
                        )
                      : const WeatherCardWidget(),
            ],
          ),
        ),
      );
    });
  }
}
