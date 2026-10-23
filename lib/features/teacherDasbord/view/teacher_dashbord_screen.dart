import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_top_design.dart';
import '../../../routes/app_routes.dart';
import '../../profile/view/profile_screen.dart';
import '../widgets/feature_card_widget.dart';
import '../widgets/top_massage.dart';

class TeacherDashbordScreen extends StatelessWidget {
  const TeacherDashbordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomTopDesign(
              iconPath: ImagePath.happyImage,
              onSettingTap: () {
                Get.to(const ProfileScreen());
              },
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: AppDimensions.paddingXL.w,
                    right: AppDimensions.paddingXL.w,
                  ),
                  child: Column(
                    children: [
                      TopMassageCard(
                        title: AppStrings.welcomeBack.tr,
                        subtitle: AppStrings.stayUpdatedAcademic.tr,
                        message: AppStrings.dashboardMessage.tr,
                      ),
                      AppDimensions.spaceHuge.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FeatureCardWidget(
                            imagePath: ImagePath.attenndenceImage,
                            title: AppStrings.attendance.tr,
                            onTap: () {
                              Get.toNamed(AppRoutes.studentAttendance);
                            },
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.homeWorkImage,
                            title: AppStrings.homework.tr,
                            onTap: () {
                              Get.toNamed(AppRoutes.teacherHomeWork);
                            },
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.resultImage,
                            title: AppStrings.result.tr,
                            onTap: () {
                              Get.toNamed(AppRoutes.studentAddMark);
                            },
                          ),
                        ],
                      ),
                      AppDimensions.spaceS.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FeatureCardWidget(
                            imagePath: ImagePath.examRutineImage,
                            title: AppStrings.examRoutine.tr,
                            onTap: () {
                              Get.toNamed(AppRoutes.teacherRoutine);
                            },
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.solutionImage,
                            title: AppStrings.solution.tr,
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.teacherSolutionQuestionList,
                              );
                            },
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.noticeImage,
                            title: AppStrings.notice.tr,
                            onTap: () {
                              Get.toNamed(AppRoutes.teacherNotice);
                            },
                          ),
                        ],
                      ),
                      AppDimensions.spaceS.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FeatureCardWidget(
                            imagePath: ImagePath.addUserMale,
                            title: AppStrings.addStudent.tr,
                            onTap: () {
                              Get.toNamed(AppRoutes.addAccount);
                            },
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.persionImage,
                            title: AppStrings.allStudent.tr,
                            onTap: () {
                              Get.toNamed(AppRoutes.allStudent);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
