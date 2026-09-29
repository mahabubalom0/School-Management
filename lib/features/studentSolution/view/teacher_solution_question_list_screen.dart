import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/core.dart';
import '../controller/teacher_solution_controller.dart';
import '../widgets/question_list_item.dart';

class TeacherSolutionQuestionListScreen extends StatelessWidget {
  const TeacherSolutionQuestionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final conttroller = Get.find<TeacherSolutionController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShipXColors.blue,
        title: CustomText(
          text: "Question List",
          fontSize: AppDimensions.fontL.sp,
          color: ShipXColors.white,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, size: AppDimensions.iconL.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: AppDimensions.paddingXL.w,
          vertical: AppDimensions.paddingL.h,
        ),
        child: Column(
          children: [
            const CustomText(
              text: "Question List",
              fontSize: AppDimensions.fontM,
            ),
            AppDimensions.spaceS.h.verticalSpace,
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: conttroller.questinList.length,
                itemBuilder: (context, index) {
                  final data = conttroller.questinList[index];
                  return QuestionListItem(
                    name: data.name,
                    question: "how are you",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
