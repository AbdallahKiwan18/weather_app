import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/colors.dart';
import 'package:weather_app/core/utils/values_manger.dart';

class CustomTextFieldWidget extends StatefulWidget {
  CustomTextFieldWidget({
    Key? key,
    required this.ctrl,
    this.text,
    this.icon,
    this.suffixIcon,
    this.keyboard,
    this.focus,
    this.fieldSubmit,
    this.enable,
    this.suffixtap,
    this.tapFocus,
    this.maxline = 1,
    this.validateType = AutovalidateMode.onUserInteraction,
  }) : super(key: key);
  final TextEditingController? ctrl;
  final String? text;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboard;
  final FocusNode? focus;
  final Function? fieldSubmit;
  final bool? enable;
  final Function? suffixtap;
  final bool? tapFocus;
  int maxline = 1;
  AutovalidateMode validateType;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  Color iconColor = AppColors.secondaryColor;

  void setFoucsNodeListener() {
    widget.focus!.addListener(() {
      if (widget.focus!.hasFocus) {
        if (mounted) {
          setState(() {
            iconColor = AppColors.primaryColor;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            iconColor = AppColors.secondaryColor;
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setFoucsNodeListener();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppPadding.p15),
      child: TextFormField(
        onTap: widget.tapFocus == true ? setFoucsNodeListener : null,
        enabled: widget.enable,
        focusNode: widget.focus,
        onFieldSubmitted: widget.fieldSubmit as void Function(String)?,
        autovalidateMode: widget.validateType,
        keyboardType: widget.keyboard,
        controller: widget.ctrl,
        maxLines: widget.maxline,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.blackColor,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: AppPadding.p15, horizontal: AppPadding.p24),
          hintText: widget.text,
          hintStyle:
              TextStyle(fontSize: AppFontSize.s12, color: AppColors.blackColor),
          suffixIcon: widget.suffixIcon != null
              ? Padding(
                  padding: EdgeInsetsDirectional.only(end: AppPadding.p15),
                  child: SizedBox(
                    child: GestureDetector(
                      onTap: widget.suffixtap as void Function()?,
                      child: Icon(
                        widget.suffixIcon,
                        size: AppSize.s25,
                        color: iconColor,
                      ),
                    ),
                  ),
                )
              : null,
          errorStyle: TextStyle(fontSize: AppFontSize.s12),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: AppSize.s2, color: AppColors.secondaryColor),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s25)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: AppSize.s2, color: AppColors.secondaryColor),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s25)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: AppSize.s2, color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s25)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: AppSize.s2, color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s25)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: AppSize.s2, color: AppColors.primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s25)),
          ),
        ),
      ),
    );
  }
}
