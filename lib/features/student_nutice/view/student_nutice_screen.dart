import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_image_view.dart';
import 'package:get/get.dart';

class StudentNuticeScreen extends StatelessWidget {
  const StudentNuticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: AppDimensions.paddingXL.w,
          right: AppDimensions.paddingXL.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Enter Details ",
                  fontSize: AppDimensions.fontXS.sp,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                CustomTextField(
                  controller: TextEditingController(),
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
            CustomButton(
              text: "Send",
              onPressed: () {},
              color: ShipXColors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
