import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../controller/student_solution_controller.dart';

class EditeQuestionStudent extends StatelessWidget {
  final int id;
  const EditeQuestionStudent({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentSolutionController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShipXColors.blue,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new, size: AppDimensions.iconM.sp),
        ),
        title: const CustomText(
          text: "Edite Question",
          fontSize: AppDimensions.fontL,
          color: ShipXColors.white,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: AppDimensions.paddingXXL.w,
          vertical: AppDimensions.paddingHUGE.h,
        ),
        child: CustomButton(
          text: "Edite Question",
          isLoading: controller.isLoading.value,
          onPressed: () {
            controller.editeQuestion(id);
          },
          color: ShipXColors.blue,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.paddingXXL.h,
          horizontal: AppDimensions.paddingXL.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: controller.editequestionController,
              hintText: "Write your question",
              maxLine: 5,
              minLine: 5,
            ),
            AppDimensions.spaceXL.h.verticalSpace,
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingXL.w,
                  vertical: AppDimensions.paddingM.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusM.r),
                  color: ShipXColors.blue,
                ),
                child: const CustomText(
                  text: "Upload File",
                  fontSize: AppDimensions.fontL,
                  color: ShipXColors.background,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
