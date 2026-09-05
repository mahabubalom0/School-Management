import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_image_view.dart';

class StudentSolutionScreen extends StatelessWidget {
  const StudentSolutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: ShipXColors.blue,
        leading: Padding(
          padding: EdgeInsetsGeometry.only(left: AppDimensions.paddingM.w),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: AppDimensions.iconL.sp,
              color: ShipXColors.background,
            ),
          ),
        ),
        title: Row(
          children: [
            CustomImageView(
              imagePath: ImagePath.solutionImage,
              height: AppDimensions.imageSize38.h,
              width: AppDimensions.imageSize38.w,
              color: ShipXColors.background,
            ),
            AppDimensions.spaceL.w.horizontalSpace,
            CustomText(
              text: "SOLUTION",
              fontSize: AppDimensions.fontM.sp,
              color: ShipXColors.background,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: AppDimensions.paddingXL.w,
          right: AppDimensions.paddingXL.w,
          top: AppDimensions.paddingXL.h,
          bottom: AppDimensions.paddingXL.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Question #1",
                fontSize: AppDimensions.fontM.sp,
                fontWeight: FontWeight.bold,
                color: ShipXColors.black,
              ),
              AppDimensions.spaceS.h.verticalSpace,
              CustomText(
                text: "What is the capital of Bangladesh?",
                fontSize: AppDimensions.fontM.sp,
                color: ShipXColors.black,
              ),
              AppDimensions.spaceL.h.verticalSpace,
              CustomText(
                text: "Enter Details:",
                fontSize: AppDimensions.fontM.sp,
                color: ShipXColors.black,
              ),
              AppDimensions.spaceS.h.verticalSpace,
              CustomTextField(
                controller: TextEditingController(),
                hintText: "",
                minLine: 15,
                maxLine: 15,
              ),
              AppDimensions.spaceM.h.verticalSpace,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ShipXColors.blue,
                ),
                onPressed: () {},
                child: CustomText(
                  text: "Upload File",
                  fontSize: AppDimensions.fontS.sp,
                  color: ShipXColors.background,
                ),
              ),
              AppDimensions.spaceXL.h.verticalSpace,
              CustomButton(
                text: "Send",
                onPressed: () {},
                color: ShipXColors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
