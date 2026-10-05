import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../../core/core.dart';
import '../../../routes/app_routes.dart';
import '../controller/teacher_result_controller.dart';
import '../model/student_show_model.dart';
import '../widget/result_item.dart';

class TeacherResultScreen extends StatelessWidget {
  const TeacherResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TeacherResultController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShipXColors.green,
        title: CustomText(
          text: "Student Result",
          color: ShipXColors.black,
          fontSize: AppDimensions.fontL.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: AppDimensions.paddingXL.w,
          vertical: AppDimensions.paddingXL.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "All Student Result",
              fontSize: AppDimensions.font13,
              color: ShipXColors.black,
            ),
            AppDimensions.spaceS.h.verticalSpace,
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(color: ShipXColors.green),
                  );
                }

                final uniqueResults = <String, StudentShowModel>{};
                for (var res in controller.studentResult) {
                  final key = "${res.className}_${res.exam}";
                  if (!uniqueResults.containsKey(key)) {
                    uniqueResults[key] = res;
                  }
                }
                final groupedList = uniqueResults.values.toList();

                if (groupedList.isEmpty) {
                  return const Center(
                    child: CustomText(
                      text: "No result found",
                      fontSize: AppDimensions.font13,
                      color: ShipXColors.black,
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: groupedList.length,
                  itemBuilder: (context, index) {
                    final item = groupedList[index];
                    return ResultItem(
                      title: item.exam ?? "Unknown Exam",
                      classId: item.className ?? "Unknown",
                      onTap: () {
                        final filteredStudents = controller.studentResult
                            .where((s) =>
                                s.className == item.className &&
                                s.exam == item.exam)
                            .toList();
                        Get.toNamed(
                          AppRoutes.resultDeatils,
                          arguments: {
                            "class": item.className,
                            "exam": item.exam,
                            "students": filteredStudents,
                          },
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _showStudentsBottomSheet(
    BuildContext context,
    String? className,
    String? exam,
    List<StudentShowModel> allStudents,
  ) {
    final students = allStudents
        .where((s) => s.className == className && s.exam == exam)
        .toList();

    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(AppDimensions.paddingL.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimensions.radiusXL.r),
          ),
        ),
        child: Column(
          children: [
            CustomText(
              text: "Class ${className ?? 'N/A'} - ${exam ?? 'N/A'}",
              fontSize: AppDimensions.fontL.sp,
              fontWeight: FontWeight.bold,
              color: ShipXColors.deepBlue,
            ),
            AppDimensions.spaceM.h.verticalSpace,
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final s = students[index];
                  return ListTile(
                    title: CustomText(
                      text: s.name ?? "Unknown",
                      fontSize: AppDimensions.fontM.sp,
                      color: ShipXColors.deepBlue,
                      fontWeight: FontWeight.w600,
                    ),
                    subtitle: CustomText(
                      text:
                          "Roll: ${s.roll ?? 'N/A'} | Section: ${s.section ?? 'N/A'} | Subject: ${s.subject ?? 'N/A'}",
                      fontSize: AppDimensions.fontXS.sp,
                      color: Colors.grey,
                    ),
                    trailing: CustomText(
                      text: "${s.mark ?? 0}",
                      fontSize: AppDimensions.fontL.sp,
                      fontWeight: FontWeight.bold,
                      color: ShipXColors.green,
                    ),
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
