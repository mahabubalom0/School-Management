import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_label_textfiled_item.dart';
import '../../../../core/widgets/custom_top_design.dart';
import '../../../../routes/app_routes.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    final colors = context.appColors;

    return Scaffold(
      backgroundColor: colors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTopDesign(iconPath: ImagePath.logo),
            Padding(
              padding: EdgeInsetsGeometry.only(
                left: AppDimensions.paddingXL.w,
                right: AppDimensions.paddingXL.w,
              ),
              child: Column(
                children: [
                  AppDimensions.spaceMassive.h.verticalSpace,
                  CustomLabelTextfiledItem(
                    title: AppStrings.userName.tr,
                    hintText: AppStrings.enterYourUserName.tr,
                    controller: controller.usernameController,
                  ),
                  AppDimensions.paddingXL.h.verticalSpace,
                  CustomLabelTextfiledItem(
                    title: AppStrings.password.tr,
                    hintText: AppStrings.enterYourPassword.tr,
                    controller: controller.passwordController,
                  ),
                  AppDimensions.paddingXXL.h.verticalSpace,
                  CustomButton(text: AppStrings.login.tr, onPressed: () {
                    controller.login();
                  }),
                  AppDimensions.spaceXL.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: AppStrings.dontHaveAccount.tr,
                        color: context.appColors.textPrimary,
                        fontSize: AppDimensions.fontS,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.register);
                        },
                        child: CustomText(
                          text: AppStrings.signUp.tr,
                          color: context.appColors.primary,
                          fontSize: AppDimensions.fontS,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  AppDimensions.spaceXXL.h.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
