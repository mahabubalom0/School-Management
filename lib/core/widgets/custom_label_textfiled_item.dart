import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core.dart';

class CustomLabelTextfiledItem extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final Widget? prefixIcon;
  const CustomLabelTextfiledItem({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, fontSize: AppDimensions.fontM),
        AppDimensions.spaceXS.h.verticalSpace,
        CustomTextField(
          controller: controller,
          hintText: hintText,
          isPassword: isPassword,
          prefixIcon: prefixIcon,
        ),
      ],
    );
  }
}
