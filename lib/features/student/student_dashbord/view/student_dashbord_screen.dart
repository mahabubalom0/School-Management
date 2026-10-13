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
                    title: AppStrings.profileOfSchool.tr,
                    iconPath: ImagePath.schoolHouseImage,
                    onTap: () {},
                  ),
                  AppDimensions.spaceXL.h.verticalSpace,
                  StudentDrawerItem(
                    title: AppStrings.profileOfPublication.tr,
                    iconPath: ImagePath.profilePublicatonImage,
                    onTap: () {},
                  ),
                  AppDimensions.spaceXL.h.verticalSpace,
                  StudentDrawerItem(
                    title: AppStrings.emergencyContacts.tr,
                    iconPath: ImagePath.emergencyContactImage,
                    onTap: () {},
                  ),
                  AppDimensions.spaceXL.h.verticalSpace,
                  StudentDrawerItem(
                    title: AppStrings.settingsTitle.tr,
                    iconPath: ImagePath.settingImage,
                    onTap: () {},
                  ),
                  AppDimensions.spaceXL.h.verticalSpace,
                  StudentDrawerItem(
                    title: AppStrings.logout.tr,
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
                            onTap: () {},
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.homeWorkImage,
                            title: AppStrings.homework.tr,
                            onTap: () {
                              Get.toNamed(AppRoutes.studentHomeWork);
                            },
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.resultImage,
                            title: AppStrings.result.tr,
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
                            title: AppStrings.examRoutine.tr,
                            onTap: () {},
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.solutionImage,
                            title: AppStrings.solution.tr,
                            onTap: () {
                              Get.toNamed(AppRoutes.studentSolution);
                            },
                          ),
                          FeatureCardWidget(
                            imagePath: ImagePath.quizeImage,
                            title: AppStrings.quiz.tr,
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
