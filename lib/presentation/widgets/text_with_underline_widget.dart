import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/colors.dart';
import 'package:weather_app/core/utils/values_manger.dart';

class TextWithUnderLineWidget extends StatelessWidget {
  final String? title;
  const TextWithUnderLineWidget({this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 3.0, // Adjust the height of the underline
            color: AppColors.primaryColor, // Adjust the underline color
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: AppSize.s10),
          child: Text(
            title!,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
