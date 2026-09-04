import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_image_view.dart';
import '../controller/student_home_work_controller.dart';
import '../widgets/academic_filter_card.dart';

class StudentHomeWorkScreen extends StatelessWidget {
  const StudentHomeWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentHomeWorkController>();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsetsGeometry.only(left: AppDimensions.paddingL.w),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: AppDimensions.iconL.sp,
              color: ShipXColors.background,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        backgroundColor: ShipXColors.blue,
        toolbarHeight: 80.h,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImagePath.homeWorkImage,
              height: AppDimensions.imageSize38.h,
              width: AppDimensions.imageSize38.w,
              color: ShipXColors.background,
            ),
            AppDimensions.spaceS.w.horizontalSpace,
            CustomText(
              text: "HomeWork",
              fontSize: AppDimensions.fontXXL.sp,
              color: ShipXColors.background,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            left: AppDimensions.paddingXL.w,
            right: AppDimensions.paddingXL.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppDimensions.spaceHuge.h.verticalSpace,
              CustomText(
                text: "Your Daily Homework",
                fontSize: AppDimensions.fontM.sp,
                fontWeight: FontWeight.bold,
                color: ShipXColors.black,
              ),
              AppDimensions.spaceS.h.verticalSpace,
              CustomText(
                text:
                    "Stay on top of your studies! Check below for the latest homework and assignments given by your teachers.",
                fontSize: AppDimensions.fontXS.sp,
                color: ShipXColors.black,
              ),
              AppDimensions.spaceXL.h.verticalSpace,
              AcademicFilterCard(
                classList: controller.classList,
                sectionsList: controller.sectionsList,
                subjectsList: controller.subjectsList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
