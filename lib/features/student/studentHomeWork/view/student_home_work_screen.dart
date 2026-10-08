import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import '../../../../core/core.dart';
import '../widgets/student_home_work_item.dart';

class StudentHomeWorkScreen extends StatelessWidget {
  const StudentHomeWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShipXColors.blue,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: AppDimensions.iconM.sp),
        ),
        title: const CustomText(
          text: "Student Home Work",
          fontSize: AppDimensions.font13,
          color: ShipXColors.background,
        ),
        actions: [
          Icon(Icons.print, size: AppDimensions.iconM.sp),
          AppDimensions.spaceM.w.horizontalSpace,
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: AppDimensions.paddingXL.w,
          vertical: AppDimensions.padding40.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Home Work", fontSize: AppDimensions.font13.sp),

            AppDimensions.spaceM.h.verticalSpace,
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const StudentHomeWorkItem(
                    className: "1St Semister",
                    department: "Computer Sceince And TechNology",
                    submissionDate: "1 OctoBar 2026",
                    section: "A ",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
