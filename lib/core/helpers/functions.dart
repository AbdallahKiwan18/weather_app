import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/values_manger.dart';

void showCustomDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Center(
          child: Container(
            height: AppSize.s120,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: Material(
                child: Center(
                    child: Text(
              "App Need Location",
              style: Theme.of(context).textTheme.titleLarge,
            ))),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }
      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
