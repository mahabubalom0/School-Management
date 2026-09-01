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
                      title: "Name",
                      hintText: "Enter Your Name",
                      controller: controller.nameController,
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: "Email",
                      hintText: "Enter Your Email",
                      controller: controller.emailController,
                    ),
                     CustomLabelTextfiledItem(
                      title: "Password",
                      hintText: "Enter Your Password",
                      controller: controller.passwordController,
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: "Class",
                      hintText: "Enter Your Class",
                      controller: controller.classController,
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: "Section",
                      hintText: "Enter Your Sction",
                      controller: controller.sectionController,
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: "Roll No",
                      hintText: "Enter Your Roll No",
                      controller: controller.rollNoController,
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: "Group",
                      hintText: "Enter Your Group",
                      controller: controller.groupController,
                    ),

                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: "Address",
                      hintText: "Enter Your Address",
                      controller: controller.addressController,
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomDropdownField<String>(
                      hintText: "Gender",
                      items: controller.genderOptions,
                      getLabel: (String value) => value,
                      onChanged: (String? change) {
                        controller.genderController.text = change!;
                      },
                    ),
                    AppDimensions.spaceHuge.h.verticalSpace,
                    CustomButton(text: "Singin", onPressed: () {
                      controller.handleRegistration();
                    }),
                    AppDimensions.spaceM.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Already have an account? ",
                          color: context.appColors.textPrimary,
                          fontSize: AppDimensions.fontS,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.login);
                          },
                          child: CustomText(
                            text: "Login",
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
