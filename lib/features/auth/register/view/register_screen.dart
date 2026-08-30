import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_dropdown_field.dart';
import '../../../../core/widgets/custom_label_textfiled_item.dart';
import '../../../../core/widgets/custom_top_design.dart';
import '../../../../routes/app_routes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      controller: TextEditingController(),
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: "Email",
                      hintText: "Enter Your Email",
                      controller: TextEditingController(),
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: "Class",
                      hintText: "Enter Your Class",
                      controller: TextEditingController(),
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: "Section",
                      hintText: "Enter Your Sction",
                      controller: TextEditingController(),
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: "Roll No",
                      hintText: "Enter Your Roll No",
                      controller: TextEditingController(),
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: "Group",
                      hintText: "Enter Your Group",
                      controller: TextEditingController(),
                    ),

                    AppDimensions.spaceM.h.verticalSpace,
                    CustomLabelTextfiledItem(
                      title: "Address",
                      hintText: "Enter Your Address",
                      controller: TextEditingController(),
                    ),
                    AppDimensions.spaceM.h.verticalSpace,
                    CustomDropdownField<String>(
                      hintText: "Gender",
                      items: const ['Male', 'Female', 'Other'],
                      getLabel: (String value) => value,
                      onChanged: (String? change) {},
                    ),
                    AppDimensions.spaceHuge.h.verticalSpace,
                    CustomButton(text: "Singin", onPressed: () {}),
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
