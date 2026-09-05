import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../controller/profile_controller.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_settings_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final maxWidth = getValue<double>(
      mobile: double.infinity,
      tablet: 640,
      desktop: 720,
    );
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppDimensions.paddingL.r),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileHeaderWidget(),
                  SizedBox(height: AppDimensions.spaceXXL.h),
                  const ProfileSettingsSectionWidget(),
                  SizedBox(height: AppDimensions.spaceXXL.h),
                  CustomButton(
                    text: AppStrings.logout.tr,
                    icon: Icons.logout_rounded,
                    color: colors.error.withValues(alpha: 0.1),
                    textColor: colors.error,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          insetPadding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                vertical: AppDimensions.paddingXL.h,
                                horizontal: AppDimensions.paddingXL.w,
                              ),
                              child: Column(
                                children: [
                                  CustomText(
                                    text: AppStrings.logout.tr,
                                    fontSize: AppDimensions.fontM.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ShipXColors.background,
                                  ),
                                  SizedBox(height: AppDimensions.spaceXL.h),
                                  CustomText(
                                    text: "Are you sure you want to logout?",
                                    fontSize: AppDimensions.fontM.sp,
                                    color: ShipXColors.background,
                                  ),
                                  SizedBox(height: AppDimensions.spaceXL.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () => Get.back(),
                                        child: CustomText(
                                          text: "Cancel",
                                          fontSize: AppDimensions.fontXS.sp,
                                          color: ShipXColors.background,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          if (controller.isLoading.value) {
                                            return;
                                          }
                                          await controller.logout();
                                        },
                                        child: Obx(
                                          () => controller.isLoading.value
                                              ? const CircularProgressIndicator()
                                              : CustomText(
                                                  text: "Logout",
                                                  fontSize:
                                                      AppDimensions.fontXS.sp,
                                                  color: ShipXColors.error,
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
