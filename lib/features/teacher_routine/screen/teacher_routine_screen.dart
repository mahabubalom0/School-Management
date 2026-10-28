import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../controller/teacher_routine_controller.dart';
import '../widgets/teacher_routine_item.dart';

class TeacherRoutineScreen extends StatelessWidget {
  const TeacherRoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.isRegistered<TeacherRoutineController>()
        ? Get.find<TeacherRoutineController>()
        : Get.put(TeacherRoutineController());

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
      body: SafeArea(child: Padding(
        padding: EdgeInsets.only(
          left: AppDimensions.paddingXL.w,
          right: AppDimensions.paddingXL.w,
          top: AppDimensions.paddingXL.h,
          bottom: AppDimensions.paddingL.h,
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
            AppDimensions.spaceM.h.verticalSpace,
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.routineList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: AppDimensions.paddingL.h,
                      ),
                      child: TeacherRoutineItem(
                        key: ValueKey(controller.routineList[index]),
                        item: controller.routineList[index],
                        index: index,
                        showRemove: controller.routineList.length > 1,
                        onRemove: () => controller.removeRoutine(index),
                      ),
                    );
                  },
                ),
              ),
            ),
            AppDimensions.spaceM.h.verticalSpace,
            CustomButton(
              text: AppStrings.addMore.tr,
              icon: Icons.add,
              color: ShipXColors.blue,
              onPressed: () {
                controller.addRoutine();
              },
            ),
          ],
        ),
      ),
   ) );
  }
}
