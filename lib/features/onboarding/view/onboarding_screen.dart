import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_top_design.dart';
import '../controller/onboarding_controller.dart';
import '../widget/management_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    final maxWidth = getValue<double>(
      mobile: double.infinity,
      tablet: 480,
      desktop: 560,
    );

    return Scaffold(
      backgroundColor: context.appColors.background,
      body: Column(
        children: [
          const CustomTopDesign(iconPath: ImagePath.logo),

          AppDimensions.spaceXL.h.verticalSpace,
          CustomText(
            text: "Choose your option",
            fontSize: AppDimensions.fontL.sp,
            fontWeight: FontWeight.w600,
          ),

          AppDimensions.spaceXL.h.verticalSpace,
          Padding(
            padding: EdgeInsetsGeometry.only(
              left: AppDimensions.paddingXL.w,
              right: AppDimensions.paddingXL.w,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ManagementItem(
                      title: 'Student',
                      iconPath: ImagePath.studentMale,
                      onTap: () {
                        // Handle tap
                      },
                    ),
                    AppDimensions.spaceHuge.w.horizontalSpace,
                    ManagementItem(
                      title: 'Teacher',
                      iconPath: ImagePath.tutionImage,
                      onTap: () {
                        // Handle tap
                      },
                    ),
                  ],
                ),  AppDimensions.spaceHuge.h.verticalSpace,
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ManagementItem(
                      title: "Guest",
                      iconPath: ImagePath.persionImage,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
