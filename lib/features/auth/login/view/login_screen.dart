import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../core/utils/app_images.dart';
import '../controller/login_controller.dart';
import '../widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    final colors = context.appColors;

    final maxWidth = getValue<double>(
      mobile: double.infinity,
      tablet: 480,
      desktop: 520,
    );

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: hPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  80.h.verticalSpace,
                  CustomText(
                    text: AppStrings.welcomeBack.tr,
                    style: ShipXTextStyles.heading4,
                  ),
                  16.h.verticalSpace,
                  CustomText(
                    text: AppStrings.loginToContinue.tr,
                    style: ShipXTextStyles.body3,
                    color: colors.textSecondary,
                  ),
                  40.h.verticalSpace,
                  CustomText(
                    text: AppStrings.email.tr,
                    style: ShipXTextStyles.body2,
                    fontWeight: FontWeight.w500,
                  ),
                  16.h.verticalSpace,
                  CustomTextField(
                    controller: controller.emailController,
                    hintText: AppStrings.emailHint.tr,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  24.h.verticalSpace,

                  CustomText(
                    text: AppStrings.password.tr,
                    style: ShipXTextStyles.body2,
                    fontWeight: FontWeight.w500,
                  ),
                  16.h.verticalSpace,
                  Obx(
                    () => CustomTextField(
                      controller: controller.passwordController,
                      hintText: AppStrings.passwordHint.tr,
                      isPassword: true,
                      obscureText: controller.isObscure.value,
                      onTogglePassword: controller.onToggleObscure,
                    ),
                  ),
                  20.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => SizedBox(
                              height: 24.w,
                              width: 24.w,
                              child: Checkbox(
                                value: controller.rememberMe.value,
                                onChanged: controller.onToggleRemember,
                                activeColor: colors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          CustomText(
                            text: AppStrings.rememberMe.tr,
                            style: ShipXTextStyles.body8,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: CustomText(
                          text: AppStrings.forgotPassword.tr,
                          style: ShipXTextStyles.body8,
                          color: colors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  40.h.verticalSpace,
                  Obx(
                    () => CustomButton(
                      text: AppStrings.login.tr,
                      isLoading: controller.isLoading.value,
                      onPressed: controller.login,
                      height: 56.h,
                      borderRadius: 12.r,
                    ),
                  ),
                  24.h.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: colors.border, thickness: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: CustomText(
                          text: AppStrings.createWith.tr,
                          style: ShipXTextStyles.body8,
                          color: colors.textSecondary.withValues(alpha: 0.6),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: colors.border, thickness: 1),
                      ),
                    ],
                  ),
                  24.h.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: SocialButton(
                          icon: ImagePath.google,
                          label: AppStrings.google.tr,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: SocialButton(
                          icon: ImagePath.facebook,
                          label: AppStrings.facebook.tr,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  100.h.verticalSpace,

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "${AppStrings.noAccount.tr} ",
                          style: ShipXTextStyles.body6,
                          color: colors.textPrimary,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: CustomText(
                            text: AppStrings.signUp.tr,
                            style: ShipXTextStyles.body6,
                            color: colors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.h.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
