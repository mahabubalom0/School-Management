import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../controller/student_home_work_controller.dart';
import '../model/home_work_model.dart';

class StudentHomeWorkDeatils extends StatelessWidget {
  const StudentHomeWorkDeatils({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentHomeWorkController>();
    final arguments = Get.arguments as Map<String, dynamic>?;
    final hwData = arguments?['hwData'] as HomeWorkModel?;
    final index = arguments?['index'];

    if (hwData == null) {
      return Scaffold(
        appBar: AppBar(title: Text(AppStrings.studentHomeWorkDetails.tr)),
        body: Center(child: Text(AppStrings.noHomeworkDetailsFound.tr)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShipXColors.blue,
        title: Text(
          AppStrings.studentHomeWorkDetails.tr,
          style: TextStyle(
            fontSize: AppDimensions.fontS.sp,
            color: ShipXColors.background,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.printHomeWorkDetails(
                hwData: hwData,
                index: index,
              );
            },
            icon: Icon(
              Icons.print,
              color: ShipXColors.white,
              size: AppDimensions.iconM.sp,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: AppDimensions.paddingL.w,
          right: AppDimensions.paddingL.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDimensions.spaceL.h.verticalSpace,
            Container(
              width: double.infinity,
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: AppDimensions.paddingL.w,
                vertical: AppDimensions.paddingL.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radiusL),
                color: ShipXColors.teal.withValues(alpha: 0.5),
                border: BoxBorder.all(color: ShipXColors.deepBlue, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "${AppStrings.subject.tr} : ${hwData.subject ?? AppStrings.noData.tr}",
                    fontSize: AppDimensions.font13,
                    color: ShipXColors.black,
                  ),
                  AppDimensions.spaceS.h.verticalSpace,
                  CustomText(
                    text: "${AppStrings.className.tr} : ${hwData.className ?? AppStrings.noClass.tr}",
                    fontSize: AppDimensions.font13,
                    color: ShipXColors.black,
                  ),
                  AppDimensions.spaceS.h.verticalSpace,
                  CustomText(
                    text: "${AppStrings.section.tr} : ${hwData.section}",
                    fontSize: AppDimensions.font13,
                    color: ShipXColors.black,
                  ),
                  AppDimensions.spaceS.h.verticalSpace,
                  CustomText(
                    text: "${AppStrings.deadline.tr} : ${hwData.dateLine != null ? controller.formatDate(hwData.dateLine) : AppStrings.noData.tr}",
                    fontSize: AppDimensions.font13,
                    color: ShipXColors.black,
                  ),
                  AppDimensions.spaceS.h.verticalSpace,
                  CustomText(
                    text: "${AppStrings.createdAt.tr} : ${hwData.createAt != null ? controller.formatDate(hwData.createAt) : AppStrings.noData.tr}",
                    fontSize: AppDimensions.font13,
                    color: ShipXColors.black,
                  ),
                ],
              ),
            ),
            AppDimensions.spaceXL.h.verticalSpace,
            CustomText(
              text: "${AppStrings.homework.tr} : $index :- ",
              fontSize: AppDimensions.fontS,
              color: ShipXColors.black,
            ),
            AppDimensions.spaceL.verticalSpace,
            CustomText(
              text: hwData.addHomework ?? AppStrings.noHomeworkToday.tr,
              fontSize: AppDimensions.fontL,
              color: ShipXColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
