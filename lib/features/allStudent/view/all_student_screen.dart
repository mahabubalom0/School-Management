import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../../../routes/app_routes.dart';
import '../controller/all_student_controller.dart';
import '../widgets/no_data_item.dart';
import '../widgets/student_item_card.dart';

class AllStudentScreen extends StatelessWidget {
  const AllStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AllStudentController>();
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "All Student",
          fontSize: AppDimensions.fontM,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getAllStudent();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  controller.semesterName.length,
                  (index) => Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.selectedSemesterIndex.value = index;
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: AppDimensions.paddingS.w,
                          right: AppDimensions.paddingS.w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: controller.selectedSemesterIndex.value == index
                              ? ShipXColors.blue
                              : ShipXColors.body,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusM.r,
                          ),
                        ),
                        child: CustomText(
                          text: controller.semesterName[index].toString(),
                          color: ShipXColors.background,
                          fontSize: AppDimensions.fontM,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            AppDimensions.spaceL.h.verticalSpace,
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: AppDimensions.paddingXL.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => CustomText(
                      text: controller.selectedSemesterIndex.value == 0
                          ? "All Student (${controller.allStudentList.length})"
                          : "Semester ${controller.selectedSemesterIndex.value} (${controller.allStudentList.length})",
                      fontSize: AppDimensions.fontL,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppDimensions.spaceL.h.verticalSpace,
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (controller.allStudentList.isEmpty) {
                      return const NoDataItem();
                    }
                    return ListView.builder(
                      itemCount: controller.allStudentList.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        final item = controller.allStudentList[index];
                        return StudentItemCard(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.studentDeatilesScreen,
                              arguments: item,
                            );
                          },
                          className: item.studentClass ?? 'N/A',
                          name: item.name ?? 'Unknown',
                          studentId: item.studentId ?? 'N/A',
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
