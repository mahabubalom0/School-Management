import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../controller/student_solution_controller.dart';
import '../model/student_question_model.dart';

class StudentDeatilsSolution extends StatelessWidget {
  const StudentDeatilsSolution({super.key});

  @override
  Widget build(BuildContext context) {
    final item = Get.arguments['item'] as StudentQuestionModel;
    final index = Get.arguments['index'];
    final controller = Get.find<StudentSolutionController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShipXColors.blue,
        title: const CustomText(
          text: "Question Solution From Teacher",
          fontSize: AppDimensions.fontL,
          color: ShipXColors.backgroundLight,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingXL.w,
          vertical: AppDimensions.paddingHUGE.h,
        ),
        child: CustomButton(
          text: "Share Answer",
          onPressed: () {
            if (item.questionAns != null && item.questionAns!.isNotEmpty) {
              controller.downloadAnswerAsPdf(item.question, item.questionAns!);
            } else {
              controller.showSnackbar("Error", "No Solution Available");
            }
          },
          color: ShipXColors.blue,
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: ShipXColors.blue,
        onRefresh: () async {
          await controller.getQuestions();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: AppDimensions.paddingXL.w,
              vertical: AppDimensions.padding40.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Question #${index + 1}",
                  fontSize: AppDimensions.fontXL,
                  fontWeight: FontWeight.bold,
                  color: ShipXColors.black,
                ),
                AppDimensions.spaceL.h.verticalSpace,
                CustomText(
                  text: item.question,
                  fontSize: AppDimensions.fontM,
                  color: ShipXColors.black,
                ),
                AppDimensions.spaceM.h.verticalSpace,
                Divider(color: ShipXColors.body.withValues(alpha: 0.5)),
                AppDimensions.spaceM.h.verticalSpace,

                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CustomText(
                        text: "Answer Loading......",
                        fontSize: AppDimensions.fontXL,
                        color: ShipXColors.blue,
                      ),
                    );
                  }
                  if (controller.questionsList[index].questionAns!.isEmpty) {
                    return const Center(
                      child: CustomText(
                        text: "No Solution Yet",
                        fontSize: AppDimensions.fontXL,
                        color: ShipXColors.black,
                      ),
                    );
                  }
                  return CustomText(
                    text: item.questionAns!,
                    fontSize: AppDimensions.fontM,
                    color: ShipXColors.black,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
