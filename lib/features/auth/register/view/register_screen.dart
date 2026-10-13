import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_dropdown_field.dart';
import '../../../../core/widgets/custom_label_textfiled_item.dart';
import '../../../../core/widgets/custom_top_design.dart';
import '../../../../routes/app_routes.dart';
import '../controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<RegisterController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTopDesign(iconPath: ImagePath.logo),
            AppDimensions.spaceXXL.h.verticalSpace,
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppDimensions.paddingXL.w,
                  right: AppDimensions.paddingXL.w,
                ),
                child: Column(
                  children: [
                    CustomLabelTextfiledItem(
                      title: AppStrings.name.tr,
                      hintText: AppStrings.enterYourName.tr,
                      controller: controller.nameController,
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: AppStrings.email.tr,
                      hintText: AppStrings.enterYourEmail.tr,
                      controller: controller.emailController,
                    ),
                     CustomLabelTextfiledItem(
                      title: AppStrings.password.tr,
                      hintText: AppStrings.enterYourPassword.tr,
                      controller: controller.passwordController,
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: AppStrings.className.tr,
                      hintText: AppStrings.enterYourClass.tr,
                      controller: controller.classController,
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: AppStrings.section.tr,
                      hintText: AppStrings.enterYourSection.tr,
                      controller: controller.sectionController,
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: AppStrings.rollNo.tr,
                      hintText: AppStrings.enterYourRollNo.tr,
                      controller: controller.rollNoController,
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: AppStrings.group.tr,
                      hintText: AppStrings.enterYourGroup.tr,
                      controller: controller.groupController,
                    ),

                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: AppStrings.address.tr,
                      hintText: AppStrings.enterYourAddress.tr,
                      controller: controller.addressController,
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomDropdownField<String>(
                      hintText: AppStrings.gender.tr,
                      items: controller.genderOptions,
                      getLabel: (String value) => value,
                      onChanged: (String? change) {
                        controller.genderController.text = change!;
                      },
                    ),
                    AppDimensions.spaceHuge.h.verticalSpace,
                    CustomButton(text: AppStrings.signUp.tr, onPressed: () {
                      controller.handleRegistration();
                    }),
                    AppDimensions.spaceM.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: AppStrings.alreadyHaveAccount.tr,
                          color: context.appColors.textPrimary,
                          fontSize: AppDimensions.fontS,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.login);
                          },
                          child: CustomText(
                            text: AppStrings.login.tr,
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
            ),
          ],
        ),
      ),
    );
  }
}
