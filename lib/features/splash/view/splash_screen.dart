import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_image_view.dart';
import '../../../core/widgets/custom_svg_icon.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    final indicatorHeightSize = getValue<double>(
      mobile: AppDimensions.splashIconHeight,
      tablet: 150,
      desktop: 200,
    );
    final indicatorWidthSize = getValue<double>(
      mobile: AppDimensions.splashIconWidth,
      tablet: 250,
      desktop: 300,
    );

    return Scaffold(
      backgroundColor: context.appColors.background,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -120.r,
            left: -120.r,
            child: Container(
              height: 280.r,
              width: 280.r,
              decoration: const BoxDecoration(
                color: Color(0xFF27C09B),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: indicatorHeightSize.r,
              width: indicatorWidthSize.r,
              child: CustomImageView(
                imagePath: ImagePath.logo,
                height: 315.h,
                width: 275.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: -160.r,
            left: -100.w,
            right: -100.w,
            child: ClipOval(
              child: Container(
                height: 400.r,
                width: double.infinity,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 65.r),
                decoration: BoxDecoration(
                  color: const Color(0xFF1243AF),
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: Text(
                  'Powered by:XYZ COM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
