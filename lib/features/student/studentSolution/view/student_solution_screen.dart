import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import '../../../../core/core.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../routes/app_routes.dart';
import '../widgets/student_question_item.dart';

class StudentSolutionScreen extends StatelessWidget {
  const StudentSolutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.studentAddQuestion);
        },
        backgroundColor: ShipXColors.blue,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusCircular),
          side: BorderSide(color: ShipXColors.green, width: 1.5.w),
        ),
        child: Icon(Icons.add, size: AppDimensions.iconXL.sp),
      ),

      appBar: AppBar(
        backgroundColor: ShipXColors.blue,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: ShipXColors.background,
            size: AppDimensions.iconL,
          ),
        ),
        title: Row(
          children: [
            const CustomImageView(
              imagePath: ImagePath.resultImage,
              height: AppDimensions.imageSize38,
              width: AppDimensions.imageSize38,
              color: ShipXColors.bg2,
            ),
            AppDimensions.spaceS.w.horizontalSpace,
            const CustomText(
              text: "Question List",
              fontSize: AppDimensions.fontM,
              color: ShipXColors.background,
            ),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: AppDimensions.paddingXL.w,
          right: AppDimensions.paddingXL.w,
          top: AppDimensions.paddingS.h,
          bottom: AppDimensions.paddingS.h,
        ),
        child:const Column(
          children: [
            StudentQuestionItem(questionTitle: "hhhhhhhhhhhhhhhhhhhhhhhh"),
          ],
        ),
      ),
    );
  }
}
