import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../../../routes/app_routes.dart';
import '../controller/all_student_controller.dart';

class NoDataItem extends StatelessWidget {
  const NoDataItem({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllStudentController());
    return SizedBox(
      height: 400.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.noDataaImage, height: 150.h),
            AppDimensions.spaceL.verticalSpace,
            const CustomText(
              text: "No student found",
              fontSize: AppDimensions.fontM,
              fontWeight: FontWeight.w600,
            ),
            AppDimensions.spaceXS.h.verticalSpace,
            Obx(
              () => CustomText(
                text: controller.selectedSemesterIndex.value == 0
                    ? "No student added yet"
                    : "No student found in this semester",
                fontSize: AppDimensions.fontS,
                color: Colors.grey.shade600,
              ),
            ),
            AppDimensions.spaceXL.h.verticalSpace,
            CustomButton(
              onPressed: () {
                Get.toNamed(AppRoutes.addAccount);
              },
              text: "Add Student",
              color: ShipXColors.blue,
              textColor: ShipXColors.background,
            ),
          ],
        ),
      ),
    );
  }
}
