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
                    title: 'UserName',
                    hintText: 'Enter Your UserName',
                    controller: controller.usernameController,
                  ),
                  AppDimensions.paddingXL.h.verticalSpace,
                  CustomLabelTextfiledItem(
                    title: 'Password',
                    hintText: 'Enter Your Password',
                    controller: controller.passwordController,
                  ),
                  AppDimensions.paddingXXL.h.verticalSpace,
                  CustomButton(text: "Login", onPressed: () {}),
                  AppDimensions.spaceXL.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Don't have an account? ",
                        color: context.appColors.textPrimary,
                        fontSize: AppDimensions.fontS,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.register);
                        },
                        child: CustomText(
                          text: "Sign Up",
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
