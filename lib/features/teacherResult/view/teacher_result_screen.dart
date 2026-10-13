import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
          text: AppStrings.studentResult.tr,
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
            CustomText(
              text: AppStrings.allStudentResult.tr,
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
                  return Center(
                    child: CustomText(
                      text: AppStrings.noResultFound.tr,
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
                      title: item.exam ?? AppStrings.unknownExam.tr,
                      classId: item.className ?? AppStrings.unknown.tr,
                      onTap: () {
                        final filteredStudents = controller.studentResult
                            .where(
                              (s) =>
                                  s.className == item.className &&
                                  s.exam == item.exam,
                            )
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
}
