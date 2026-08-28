import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    final maxWidth = getValue<double>(mobile: double.infinity, tablet: 480, desktop: 560);
    final colors = context.appColors;

    return Scaffold(
      backgroundColor: context.appColors.background,
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(
              ImagePath.onBoarding,
              fit: BoxFit.cover,
            ),
          ),

          /// Bottom Content Box
          Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: hPadding,
                  vertical: 32.h,
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: AppStrings.onboardingWelcome.tr,
                        style: ShipXTextStyles.heading7.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 26.sp,
                        ),
                        color: colors.background,
                        textAlign: TextAlign.center,
                      ),
                      16.h.verticalSpace,
                      CustomText(
                        text: AppStrings.onboardingDesc.tr,
                        style: ShipXTextStyles.body4,
                        color: colors.background.withAlpha(180),
                        textAlign: TextAlign.center,
                      ),
                      50.h.verticalSpace,
                      CustomButton(
                        text: AppStrings.login.tr,
                        onPressed: controller.navigateToLogin,
                      ),
                      12.h.verticalSpace,
                      CustomButton(
                        text: AppStrings.register.tr,
                        onPressed: controller.navigateToRegister,
                        textColor: colors.textPrimary,
                        color: colors.background,
                      ),
                    ],
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
