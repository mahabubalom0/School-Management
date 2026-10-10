import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
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
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.homeWorkModel.isEmpty) {
                  return const Center(child: Text("No homework available"));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.homeWorkModel.length,
                  itemBuilder: (context, index) {
                    final item = controller.homeWorkModel[index];

                    return StudentHomeWorkItem(
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
