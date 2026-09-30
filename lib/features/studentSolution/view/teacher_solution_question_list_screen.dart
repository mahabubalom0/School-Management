import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../../../routes/app_routes.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Question List",
              fontSize: AppDimensions.fontM,
            ),
            AppDimensions.spaceS.h.verticalSpace,
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await conttroller.getQuestion();
                },
                child: Obx(() {
                  final unansweredList = conttroller.questinList
                      .where((element) => element.ansReplly == false)
                      .toList();
                  final answeredList = conttroller.questinList
                      .where((element) => element.ansReplly == true)
                      .toList();

                  if (conttroller.isLoading.value &&
                      conttroller.questinList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (unansweredList.isEmpty && answeredList.isEmpty) {
                    return ListView(
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      children: const [
                        SizedBox(height: 100),
                        Center(child: Text("No questions available.")),
                      ],
                    );
                  }

                  return ListView(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    children: [
                      if (unansweredList.isNotEmpty) ...[
                        CustomText(
                          text: "Pending Solutions (${unansweredList.length})",
                          fontSize: AppDimensions.fontM.sp,
                          fontWeight: FontWeight.bold,
                          color: ShipXColors
                              .error, // Red/Error color to show it's pending
                        ),
                        AppDimensions.spaceS.h.verticalSpace,
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: unansweredList.length,
                          itemBuilder: (context, index) {
                            final data = unansweredList[index];
                            return QuestionListItem(
                              name: data.name,
                              question: data.question,
                              time: conttroller.formatTime(data.createdAt),
                              onTap: () {
                                conttroller.solutionController.text =
                                    data.questionAns ?? '';
                                Get.toNamed(
                                  AppRoutes.teacherSolution,
                                  arguments: {"data": data, "index": index},
                                );
                              },
                            );
                          },
                        ),
                        AppDimensions.spaceL.h.verticalSpace,
                      ],
                      if (answeredList.isNotEmpty) ...[
                        CustomText(
                          text: "Completed Solutions (${answeredList.length})",
                          fontSize: AppDimensions.fontM.sp,
                          fontWeight: FontWeight.bold,
                          color: ShipXColors
                              .success, // Green color to show it's completed
                        ),
                        AppDimensions.spaceS.h.verticalSpace,
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: answeredList.length,
                          itemBuilder: (context, index) {
                            final data = answeredList[index];
                            return QuestionListItem(
                              name: data.name,
                              question: data.question,
                              time: conttroller.formatTime(data.createdAt),
                              onTap: () {
                                conttroller.solutionController.text =
                                    data.questionAns ?? '';
                                Get.toNamed(
                                  AppRoutes.teacherSolution,
                                  arguments: {"data": data, "index": index},
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
