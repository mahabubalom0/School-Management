import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../controller/student_attendance_controller.dart';
import '../models/student_model.dart';

class AttendanceRowWidget extends StatelessWidget {
  final StudentModel student;
  final StudentAttendanceController controller;

  const AttendanceRowWidget({
    super.key,
    required this.student,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE0E0E0), // Light grey line
            width: 1.0,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingL.w,
        vertical: 8.h, // minimal vertical padding to match the image
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CustomText(
              text: student.name,
              fontSize: AppDimensions.fontM.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Obx(
                () => Checkbox(
                  value: student.isPresent.value,
                  onChanged: (val) =>
                      controller.togglePresence(student.id, val),
                  activeColor: const Color(0xFF4A72D4),
                  side: const BorderSide(color: Color(0xFF4A72D4), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Obx(
                () => Checkbox(
                  value: student.isAbsent.value,
                  onChanged: (val) => controller.toggleAbsence(student.id, val),
                  activeColor: const Color(0xFF4A72D4),
                  side: const BorderSide(color: Color(0xFF4A72D4), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
