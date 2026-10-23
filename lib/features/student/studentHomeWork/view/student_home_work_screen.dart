import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../../../../routes/app_routes.dart';
import '../controller/student_home_work_controller.dart';
import '../widgets/student_home_work_item.dart';

class StudentHomeWorkScreen extends StatelessWidget {
  const StudentHomeWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentHomeWorkController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShipXColors.blue,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: AppDimensions.iconM.sp),
        ),
        title: CustomText(
          text: AppStrings.studentHomeWork.tr,
          fontSize: AppDimensions.font13,
          color: ShipXColors.background,
        ),
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
            CustomText(
              text: AppStrings.homework.tr,
              fontSize: AppDimensions.font13.sp,
            ),

            AppDimensions.spaceM.h.verticalSpace,
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.homeWorkModel.isEmpty) {
                  return Center(child: Text(AppStrings.noHomeworkAvailable.tr));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.homeWorkModel.length,
                  itemBuilder: (context, index) {
                    final item = controller.homeWorkModel[index];

                    return StudentHomeWorkItem(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.studentHomeWorkDeatils,
                          arguments: {"hwData": item, "index": index},
                        );
                      },
                      className: item.className ?? "",
                      department: item.subject ?? "",
                      submissionDate: controller.formatDate(item.dateLine),
                      section: item.section ?? "A ",
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
