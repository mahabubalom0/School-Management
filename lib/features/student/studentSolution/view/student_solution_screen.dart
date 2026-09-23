import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../routes/app_routes.dart';
import '../controller/student_solution_controller.dart';
import '../widgets/student_question_item.dart';
import 'edite_question_student.dart';

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
                child: CustomText(
                  text: "No questions found",
                  color: Colors.red,
                ),
              );
            }
            return ListView.builder(
              itemCount: controller.questionsList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = controller.questionsList[index];
                return Dismissible(
                  key: Key(item.id.toString()),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingL.w,
                    ),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: Colors.blue,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingL.w,
                    ),
                    child: const Icon(Icons.edit, color: Colors.white),
                  ),
                  onDismissed: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                    } else if (direction == DismissDirection.endToStart) {
                      // Right to left: Edit action
                      if (item.id != null) {
                        controller.editequestionController.text = item.question;
                        Get.to(
                          EditeQuestionStudent(id: item.id!),
                          transition: Transition.circularReveal,
                        );
                      }
                    }
                  },
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      // Left to Right (Delete)
                      if (item.id != null) {
                        return controller.deleteQuestion(item.id!);
                      }
                    } else if (direction == DismissDirection.endToStart) {
                      // Right to Left (Edit)
                      if (item.id != null) {
                        controller.editequestionController.text = item.question;
                        Get.to(
                          EditeQuestionStudent(id: item.id!),
                          transition: Transition.circularReveal,
                        );
                        return false;
                      }
                    }
                    return false;
                  },
                  child: StudentQuestionItem(questionTitle: item.question),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
