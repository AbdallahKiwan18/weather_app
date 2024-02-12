import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/colors.dart';

class CustomTextFieldWidget extends StatefulWidget {
  CustomTextFieldWidget({
    Key? key,
    required this.ctrl,
    this.text,
        this.icon,
    this.suffixicon,
    this.keyboard,
    this.focus,
    this.fieldSubmit,
    this.enable,
    this.suffixtap,
    this.tapfocus,
    this.maxline =1,
    this.validateType =AutovalidateMode.onUserInteraction,

  }) : super(key: key);
  final TextEditingController? ctrl;
  final String? text;
  final IconData? icon;
  final IconData? suffixicon;
  final TextInputType? keyboard;
  final FocusNode? focus;
  final Function? fieldSubmit;
  final bool? enable;
  final Function? suffixtap;
  final bool? tapfocus;
  int maxline =1;
  AutovalidateMode validateType;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  // Color iconColor = textcolor3;
  //
  // void setFoucsNodeListener() {
  //   widget.focus!.addListener(() {
  //     if (widget.focus!.hasFocus) {
  //       if (mounted) {
  //         setState(() {
  //           iconColor = defaultColor;
  //         });
  //       }
  //     } else {
  //       if (mounted) {
  //         setState(() {
  //           iconColor = textcolor3;
  //         });
  //       }
  //     }
  //   });
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   setFoucsNodeListener();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: TextFormField(
    //    onTap: widget.tapfocus == true ? setFoucsNodeListener : null,
        enabled: widget.enable,
        focusNode: widget.focus,
        onFieldSubmitted: widget.fieldSubmit as void Function(String)?,
        autovalidateMode: widget.validateType,
        keyboardType: widget.keyboard,
        controller: widget.ctrl,
        maxLines: widget.maxline,
        style: TextStyle(
          fontSize: 14.sp,
         // fontFamily: 'ibmregular',
          color: AppColors.blackColor,
        ),
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
          hintText: widget.text,
          hintStyle: TextStyle(
              fontSize: 14.sp, fontFamily: 'ibmregular', color: AppColors.blackColor),
          suffixIcon: widget.suffixicon != null
              ? Padding(
            padding: EdgeInsetsDirectional.only(end: 15.w),
            child: SizedBox(
              child: GestureDetector(
                onTap: widget.suffixtap as void Function()?,
                child: Icon(
                  widget.suffixicon,
                  size: 18.h,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          )
              : null,
          errorStyle: TextStyle(fontFamily: 'ibmregular', fontSize: 13.sp),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.2.w, color: AppColors.secondaryColor),
            borderRadius: BorderRadius.all(Radius.circular(30.h)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.2.w, color: AppColors.secondaryColor),
            borderRadius: BorderRadius.all(Radius.circular(30.h)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.2.w, color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(30.h)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.2.w, color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(30.h)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.2.w, color: AppColors.primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(30.h)),
          ),
        ),
      ),
    );
  }
}

