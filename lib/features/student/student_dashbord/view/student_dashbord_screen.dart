import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../core/widgets/custom_top_design.dart';
import '../../../../routes/app_routes.dart';
import '../../../teacherDasbord/widgets/feature_card_widget.dart';
import '../../../teacherDasbord/widgets/top_massage.dart';
import '../widgets/student_drawer_item.dart';

class StudentDashbordScreen extends StatelessWidget {
  const StudentDashbordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(backgroundColor: Colors.transparent),
      drawer: Drawer(
        width: 300.w, // Change this value to make it wider or narrower
        backgroundColor: ShipXColors.blue,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 280.h,
              alignment: Alignment.center, // This allows the image to be small
              decoration: const BoxDecoration(color: ShipXColors.body),
              child: SizedBox(
                height: 200.h, // Adjusted height
                width: 200.w, // Adjusted width
                child: const CustomImageView(
                  imagePath: ImagePath.logo,
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain, // Added to ensure image scales correctly
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: AppDimensions.paddingXXL.h,
                left: AppDimensions.paddingXL.w,
              ),
              child: Column(
                children: [
                  StudentDrawerItem(
                    title: "Profile of School",
                    iconPath: ImagePath.schoolHouseImage,
                    onTap: () {},
                  ),
                  AppDimensions.spaceXL.h.verticalSpace,
                  StudentDrawerItem(
                    title: "Profile of Publication",
                    iconPath: ImagePath.profilePublicatonImage,
                    onTap: () {},
                  ),
                  AppDimensions.spaceXL.h.verticalSpace,
                  StudentDrawerItem(
                    title: "Emergency Contacts",
                    iconPath: ImagePath.emergencyContactImage,
                    onTap: () {},
                  ),
                  AppDimensions.spaceXL.h.verticalSpace,
                  StudentDrawerItem(
                    title: "Settings",
                    iconPath: ImagePath.settingImage,
                    onTap: () {},
                  ),
                  AppDimensions.spaceXL.h.verticalSpace,
                  StudentDrawerItem(
                    title: "LogOut",
                    iconPath: ImagePath.logOutImage,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const CustomTopDesign(iconPath: ImagePath.logo, isSetting: false),
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
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
                            onTap: () {},
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.homeWorkImage,
                            title: 'Homework',
                            onTap: () {
                              Get.toNamed(AppRoutes.teacherHomeWork);
                            },
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.resultImage,
                            title: 'Result',
                            onTap: () {
                              Get.toNamed(AppRoutes.teacherResult);
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
                            imagePath: ImagePath.quizeImage,
                            title: 'Quiz',
                            onTap: () {
                              // Get.toNamed(AppRoutes.studentQuize);
                            },
                          ),
                        ],
                      ),
                      AppDimensions.spaceHuge.h.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
