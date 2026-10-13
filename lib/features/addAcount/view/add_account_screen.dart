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
        title: CustomText(
          text: AppStrings.addAccount.tr,
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
                  title: AppStrings.name.tr,
                  hintText: AppStrings.enterYourName.tr,
                  controller: controller.nameController,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: AppStrings.emailAddress.tr,
                  hintText: AppStrings.enterYourEmailAddress.tr,
                  controller: controller.emailController,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: AppStrings.studentId.tr,
                  hintText: AppStrings.enterYourStudentId.tr,
                  controller: controller.studentRoolClt,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: AppStrings.studentPhoneNumber.tr,
                  hintText: AppStrings.enterYourStudentPhoneNumber.tr,
                  controller: controller.studentPhoneClt,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomText(text: AppStrings.gender.tr, fontSize: AppDimensions.fontM),
                AppDimensions.spaceS.h.verticalSpace,
                CustomDropdownField(
                  hintText: AppStrings.selectYourGender.tr,
                  items: controller.gender,
                  getLabel: (item) => item.toString(),
                  onChanged: (value) {
                    if (value == null) return;
                    controller.studentGenderClt.text = value.toString();
                  },
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: AppStrings.className.tr,
                  hintText: AppStrings.enterYourClass.tr,
                  controller: controller.classAdmissionController,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: AppStrings.fathersName.tr,
                  hintText: AppStrings.enterYourFathersName.tr,
                  controller: controller.fatherNameController,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: AppStrings.mothersName.tr,
                  hintText: AppStrings.enterYourMothersName.tr,
                  controller: controller.motherNameController,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: AppStrings.dateOfBirth.tr,
                  hintText: AppStrings.enterYourDateOfBirth.tr,
                  controller: controller.dateOfBirthController,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: AppStrings.address.tr,
                  hintText: AppStrings.enterYourAddress.tr,
                  controller: controller.addressController,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomText(
                  text: AppStrings.religion.tr,
                  fontSize: AppDimensions.fontM,
                ),
                AppDimensions.spaceS.h.verticalSpace,

                CustomDropdownField(
                  hintText: AppStrings.selectYourReligion.tr,
                  items: controller.religion,
                  getLabel: (item) => item.toString(),
                  onChanged: (value) {
                    if (value == null) return;
                    controller.religionController.text = value.toString();
                  },
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomText(
                  text: AppStrings.bloodGroup.tr,
                  fontSize: AppDimensions.fontM,
                ),
                AppDimensions.spaceS.h.verticalSpace,
                CustomDropdownField(
                  hintText: AppStrings.selectYourBloodGroup.tr,
                  items: controller.bloodGroup,
                  getLabel: (item) => item.toString(),
                  onChanged: (value) {
                    if (value == null) return;
                    controller.bloodGroupController.text = value.toString();
                  },
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomLabelTextfiledItem(
                  title: AppStrings.guardiansPhoneNumber.tr,
                  hintText: AppStrings.enterYourGuardiansPhoneNumber.tr,
                  controller: controller.gradientPhoneNumberClt,
                ),
                AppDimensions.spaceXXL.h.verticalSpace,
                Obx(
                  () => controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          text: AppStrings.addStudent.tr,
                          onPressed: () {
                            controller.addStudent();
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
