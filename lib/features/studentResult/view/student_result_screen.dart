import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../../core/core.dart';
import '../../../routes/app_routes.dart';
import '../widget/result_item.dart';

class StudentResultScreen extends StatelessWidget {
  const StudentResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShipXColors.green,
        title: CustomText(
          text: "Student Result",
          color: ShipXColors.black,
          fontSize: AppDimensions.fontL.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResultItem(
              title: "Second Semester Exam",
              onTap: () {
                Get.toNamed(AppRoutes.studentAddMark);
              },
            ),
            ResultItem(title: "First Semester Exam", onTap: () {}),
            ResultItem(title: "Final Exam", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
