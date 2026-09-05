import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_top_design.dart';
import '../../../routes/app_routes.dart';
import '../widgets/feature_card_widget.dart';
import '../widgets/top_massage.dart';

class StudentDashbordScreen extends StatelessWidget {
  const StudentDashbordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomTopDesign(iconPath: ImagePath.happyImage),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: AppDimensions.paddingXL.w,
                    right: AppDimensions.paddingXL.w,
                  ),
                  child: Column(
                    children: [
                      const TopMassageCard(
                        title: 'Welcome Back!',
                        subtitle: 'Stay updated with your academic activities.',
                        message:
                            'Here you can find your daily classes, upcoming assignments, and important school announcements. Keep up the great work!',
                      ),
                      AppDimensions.spaceHuge.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FeatureCardWidget(
                            imagePath: ImagePath.attenndenceImage,
                            title: 'Attendance',
                            onTap: () {
                              Get.toNamed(AppRoutes.studentAttendance);
                            },
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.homeWorkImage,
                            title: 'Homework',
                            onTap: () {
                              Get.toNamed(AppRoutes.studentHomeWork);
                            },
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.resultImage,
                            title: 'Result',
                            onTap: () {
                              Get.toNamed(AppRoutes.studentResult);
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
                            title: 'Exam Routine',
                            onTap: () {},
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.solutionImage,
                            title: 'Solution',
                            onTap: () {
                              Get.toNamed(AppRoutes.studentSolution);
                            },
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.noticeImage,
                            title: 'Notice',
                            onTap: () {
                              Get.toNamed(AppRoutes.studentNutice);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FeatureCardWidget(
                            imagePath: ImagePath.addUserMale,
                            title: "Add User ",
                            onTap: () {},
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
