import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../controller/student_solution_controller.dart';

class StudentAddQuestion extends StatelessWidget {
  const StudentAddQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentSolutionController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShipXColors.blue,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new, size: AppDimensions.iconM.sp),
        ),
        title: Row(
          children: [
            const CustomImageView(
              imagePath: ImagePath.resultImage,
              height: AppDimensions.imageSize38,
              color: ShipXColors.background,
            ),
            AppDimensions.spaceS.w.horizontalSpace,
            const CustomText(
              text: "ASK QUESTION",
              color: ShipXColors.white,
              fontSize: AppDimensions.fontL,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingXL.w,
          vertical: AppDimensions.padding40.h,
        ),
        child: Obx(
          () => CustomButton(
            text: "Ask Question",
            isLoading: controller.isLoading.value,
            onPressed: () {
              controller.askQuestion();
            },
            color: ShipXColors.blue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.paddingXXL.h,
            horizontal: AppDimensions.paddingXL.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: "Write Your Question",
                fontSize: AppDimensions.fontL,
              ),
              AppDimensions.spaceXS.h.verticalSpace,
              CustomTextField(
                controller: controller.questionController,
                hintText: "Write your question",
                maxLine: 8,
                minLine: 8,
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
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusM.r,
                    ),
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
      ),
    );
  }
}
