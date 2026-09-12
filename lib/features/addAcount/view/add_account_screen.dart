import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../core/widgets/custom_dropdown_field.dart';
import '../../../core/widgets/custom_label_textfiled_item.dart';
import '../controller/add_ account_controller.dart';

class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddAccountController>();
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Add ACoount",
          fontSize: AppDimensions.fontM,
          color: ShipXColors.success,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: AppDimensions.paddingXL.h,
              horizontal: AppDimensions.paddingXL.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLabelTextfiledItem(
                  title: "Name",
                  hintText: "Enter Your Name",
                  controller: controller.nameController,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: "Email Address",
                  hintText: "Enter Your Email Address",
                  controller: controller.emailAddressClt,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: "Student ID",
                  hintText: "Enter Your Student ID",
                  controller: controller.studentRoolClt,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: "Student Phone Number",
                  hintText: "Enter Your Student Phone Number",
                  controller: controller.studentPhoneClt,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                const CustomText(text: "Gender", fontSize: AppDimensions.fontM),
                AppDimensions.spaceS.h.verticalSpace,
                CustomDropdownField(
                  hintText: "Select Your Gender",
                  items: controller.gender,
                  getLabel: (item) => item.toString(),
                  onChanged: (value) {
                    if (value == null) return;
                    controller.studentGenderClt.text = value.toString();
                  },
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: "Class",
                  hintText: "Enter Your Class",
                  controller: controller.classAdmissionController,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: "Father's Name",
                  hintText: "Enter Your Father's Name",
                  controller: controller.fatherNameController,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: "Mother's Name",
                  hintText: "Enter Your Mother's Name",
                  controller: controller.motherNameController,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: "Date of Birth",
                  hintText: "Enter Your Date of Birth",
                  controller: controller.dateOfBirthController,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                const CustomText(
                  text: "Religion",
                  fontSize: AppDimensions.fontM,
                ),
                AppDimensions.spaceS.h.verticalSpace,

                CustomDropdownField(
                  hintText: "Select Your Religion",
                  items: controller.religion,
                  getLabel: (item) => item.toString(),
                  onChanged: (value) {
                    if (value == null) return;
                    controller.religionController.text = value.toString();
                  },
                ),
                AppDimensions.spaceM.h.verticalSpace,
                const CustomText(
                  text: "Blood Group",
                  fontSize: AppDimensions.fontM,
                ),
                AppDimensions.spaceS.h.verticalSpace,
                CustomDropdownField(
                  hintText: "Select Your Blood Group",
                  items: controller.bloodGroup,
                  getLabel: (item) => item.toString(),
                  onChanged: (value) {
                    if (value == null) return;
                    controller.bloodGroupController.text = value.toString();
                  },
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: "Guardian's Phone Number",
                  hintText: "Enter Your Guardian's Phone Number",
                  controller: controller.gradientPhoneNumberClt,
                ),
                AppDimensions.spaceXXL.h.verticalSpace,
                CustomButton(text: "Add Student", onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
