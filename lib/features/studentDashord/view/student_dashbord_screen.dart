import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_top_design.dart';
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
                      Container(height: AppDimensions.spaceXL.h, width: double.infinity),

                      const TopMassageCard(
                        title: 'Welcome Back!',
                        subtitle: 'Stay updated with your academic activities.',
                        message:
                            'Here you can find your daily classes, upcoming assignments, and important school announcements. Keep up the great work!',
                      ),
                      AppDimensions.spaceHuge.h.verticalSpace,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FeatureCardWidget(
                            imagePath: ImagePath.attenndenceImage,
                            title: 'Attendance',
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.homeWorkImage,
                            title: 'Homework',
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.resultImage,
                            title: 'Result',
                          ),
                        ],
                      ),
                      AppDimensions.spaceS.h.verticalSpace,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FeatureCardWidget(
                            imagePath: ImagePath.examRutineImage,
                            title: 'Exam Routine',
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.solutionImage,
                            title: 'Solution',
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.noticeImage,
                            title: 'Notice',
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          FeatureCardWidget(
                            imagePath: ImagePath.addUserMale,
                            title: "Add User ",
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
