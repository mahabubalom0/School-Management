import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_image_view.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_label_textfiled_item.dart';
import '../controller/teacher_notice_controller.dart';

class TeacherNoticeScreen extends StatelessWidget {
  const TeacherNoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controler = Get.find<TeacherNoticeController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShipXColors.deepBlue,
        toolbarHeight: 100.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: ShipXColors.background,
          ),
        ),
        title: Row(
          children: [
            CustomImageView(
              imagePath: ImagePath.noticeImage,
              height: AppDimensions.imageSize38.h,
              width: AppDimensions.imageSize38.w,
              color: ShipXColors.background,
            ),
            AppDimensions.spaceS.w.horizontalSpace,
            CustomText(
              text: "NOTICE AND EVENTS",
              fontSize: AppDimensions.fontS.sp,
              color: ShipXColors.background,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.only(
          left: AppDimensions.paddingXL.w,
          right: AppDimensions.paddingXL.w,
          bottom: AppDimensions.paddingHUGE.h,
        ),
        child: Obx(() {
          return CustomButton(
            text: "Send",
            isLoading: controler.isLoading.value,
            onPressed: () {
              controler.getSendNotice();
            },
            color: ShipXColors.blue,
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            left: AppDimensions.paddingXL.w,
            right: AppDimensions.paddingXL.w,
            top: AppDimensions.paddingXL.h,
            bottom: AppDimensions.paddingL.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingS.w,
                      vertical: AppDimensions.paddingM.h,
                    ),
                    decoration: BoxDecoration(
                      color: ShipXColors.blue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusM.r,
                      ),
                      border: Border.all(color: ShipXColors.blue, width: 0.8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomLabelTextfiledItem(
                          title: "Name",
                          hintText: "Enter Your Name",
                          controller: controler.nameController,
                        ),
                        AppDimensions.spaceS.h.verticalSpace,
                        CustomLabelTextfiledItem(
                          title: "Profession",
                          hintText: "Enter Your Profession",
                          controller: controler.professionController,
                        ),
                      ],
                    ),
                  ),
                  AppDimensions.spaceL.h.verticalSpace,
                  CustomText(
                    text: "Enter Notice ",
                    fontSize: AppDimensions.fontXS.sp,
                  ),
                  AppDimensions.spaceM.h.verticalSpace,
                  CustomTextField(
                    controller: controler.noticeController,
                    hintText: "",
                    maxLine: 10,
                    minLine: 10,
                  ),
                  AppDimensions.spaceM.h.verticalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimensions.paddingM.h,
                      horizontal: AppDimensions.paddingXL.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusM.r,
                      ),
                      color: ShipXColors.blue,
                    ),
                    child: CustomText(
                      text: "Upload Image",
                      fontSize: AppDimensions.fontS.sp,
                      color: ShipXColors.background,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
