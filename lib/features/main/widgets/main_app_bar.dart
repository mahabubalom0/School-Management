import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../controller/main_controller.dart';

/// The AppBar shown at the top of the main screen.
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final MainController controller;

  const MainAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Obx(() {
        final title = switch (controller.currentIndex.value) {
          0 => AppStrings.homeTitle.tr,
          4 => AppStrings.tabProfile.tr,
          _ => AppStrings.appName.tr,
        };
        return CustomText(
          text: title,
          fontSize: getValue<double>(
            mobile: AppDimensions.fontXXL,
            tablet: AppDimensions.fontXXXL,
            desktop: 28,
          ),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        );
      }),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
