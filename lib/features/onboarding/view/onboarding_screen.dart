import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_top_design.dart';
import '../../../routes/app_routes.dart';
import '../controller/onboarding_controller.dart';
import '../widget/management_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Scaffold(
      backgroundColor: context.appColors.background,
      body: Column(
        children: [
          const CustomTopDesign(iconPath: ImagePath.logo),

          AppDimensions.spaceXL.h.verticalSpace,
          CustomText(
            text: AppStrings.chooseYourOption.tr,
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
                      title: AppStrings.student.tr,
                      iconPath: ImagePath.studentMale,
                      onTap: () {
                        // Handle tap
                       controller.getTeacher();
                      },
                    ),
                    AppDimensions.spaceHuge.w.horizontalSpace,
                    ManagementItem(
                      title: AppStrings.teacher.tr,
                      iconPath: ImagePath.tutionImage,
                      onTap: () {
                        // Handle tap
                        Get.toNamed(AppRoutes.teacherDashbord);
                      },
                    ),
                  ],
                ),
                AppDimensions.spaceHuge.h.verticalSpace,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ManagementItem(
                      title: AppStrings.guest.tr,
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
