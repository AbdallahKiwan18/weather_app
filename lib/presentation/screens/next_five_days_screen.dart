import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/utils/network_status.dart';
import 'package:weather_app/core/utils/values_manger.dart';
import 'package:weather_app/presentation/providers/weather_provider.dart';
import 'package:weather_app/presentation/widgets/loading_widget.dart';
import 'package:weather_app/presentation/widgets/text_with_underline_widget.dart';
import 'package:weather_app/presentation/widgets/day_weather_widget.dart';

class NextFiveDaysScreen extends StatefulWidget {
  const NextFiveDaysScreen({super.key});

  @override
  State<NextFiveDaysScreen> createState() => _NextFiveDaysScreenState();
}

class _NextFiveDaysScreenState extends State<NextFiveDaysScreen> {
  WeatherProvider? weatherProvider;

  @override
  void initState() {
    weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await weatherProvider?.getFiveDaysData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(builder: (context, controller, _) {
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
            (controller.getStatus() == NetworkStatus.loading)
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: const Center(child: LoadingWidget()))
                : (controller.getStatus() == NetworkStatus.error)
                    ? const Center(
                        child: Text("Location is not correct"),
                      )
                    : Expanded(
                        child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return DayWeatherWidget(
                                index: index,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: AppSize.s15);
                            },
                            itemCount: controller.fiveDaysData.length))
          ],
        ),
      );
    });
  }
}
