import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

import '../../../core/core.dart';
import '../widgets/teacher_routine_item.dart';

class TeacherRoutineScreen extends StatelessWidget {
  const TeacherRoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShipXColors.blue,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, size: AppDimensions.iconL.sp),
        ),
        title: CustomText(
          text: AppStrings.teacherRoutine.tr,
          color: ShipXColors.background,
          fontSize: AppDimensions.font13.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: AppDimensions.paddingXL.w,
          right: AppDimensions.paddingXL.w,
          top: AppDimensions.paddingXL.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppStrings.routine.tr,
              fontSize: AppDimensions.font13.sp,
              color: ShipXColors.black,
            ),
            const TeacherRoutineItem(),
          ],
        ),
      ),
    );
  }
}
