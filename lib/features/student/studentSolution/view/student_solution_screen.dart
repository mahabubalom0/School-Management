import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../routes/app_routes.dart';
import '../controller/student_solution_controller.dart';
import '../widgets/student_question_item.dart';

class StudentSolutionScreen extends StatelessWidget {
  const StudentSolutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentSolutionController>();
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

      body: RefreshIndicator(
        onRefresh: () async {
          controller.getQuestions();
        },
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            left: AppDimensions.paddingXL.w,
            right: AppDimensions.paddingXL.w,
            top: AppDimensions.paddingS.h,
            bottom: AppDimensions.paddingS.h,
          ),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.questionsList.isEmpty) {
              return const Center(
                child: CustomText(text: "No questions found", color: Colors.red),
              );
            }
            return ListView.builder(
              itemCount: controller.questionsList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = controller.questionsList[index];
                return Dismissible(
                  key: Key(item.id.toString()),
                  direction: DismissDirection.startToEnd,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingL.w),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (direction) async {
                    if (item.id != null) {
                      return  controller.deleteQuestion(item.id!);
                    }
                    return false;
                  },
                  child: StudentQuestionItem(
                    questionTitle: item.question,
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
