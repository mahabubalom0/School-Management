import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../controller/student_attendance_controller.dart';
import '../widgets/attendance_row_widget.dart';

class StudentAttendanceScreen extends StatelessWidget {
  const StudentAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentAttendanceController>();
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: CustomText(
          text: 'Semester 7th',
          fontSize: AppDimensions.fontL.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        actions: [
          CustomText(
            text: "Date : 12:10:2026",
            fontSize: AppDimensions.fontL.sp,
            fontWeight: FontWeight.w600,
            color: ShipXColors.black,
          ),
          AppDimensions.spaceM.w.horizontalSpace,
        ],
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // Header Row
          Container(
            color: const Color(0xFF4A72D4), // Matching the blue in the image
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingL.w,
              vertical: AppDimensions.paddingM.h,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: "Student Name",
                    fontSize: AppDimensions.fontS.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Present",
                    fontSize: AppDimensions.fontS.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Absent",
                    fontSize: AppDimensions.fontS.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // List View
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.studentList.length,
                itemBuilder: (context, index) {
                  var student = controller.studentList[index];
                  return AttendanceRowWidget(
                    student: student,
                    controller: controller,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
