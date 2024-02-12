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
  late final TextEditingController _searchController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    _searchController = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(builder: (context, controller, _) {
      return (controller.getStatus() == NetworkStatus.loading)
          ? const Center(child: LoadingWidget())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppPadding.p15, horizontal: AppPadding.p24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSize.s50),
                    CustomTextFieldWidget(
                        focus: _focusNode,
                        ctrl: _searchController,
                        suffixIcon: Icons.search,
                        text: "Search"),
                    const WeatherCardWidget(),
                  ],
                ),
              ),
            );
    });
  }
}
