import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../controller/all_student_controller.dart';
import '../model/all_student_model.dart';
import 'shipXAlert.dart';

class StudentDeatilesView extends StatelessWidget {
  const StudentDeatilesView({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as AllStudentModel;
    final controller = Get.put(AllStudentController());
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Get.dialog(
                ShipXAlert(
                  title: AppStrings.deleteStudent.tr,
                  content: AppStrings.deleteStudentConfirmation.tr,
                  cancelTap: () {
                    Get.back();
                  },
                  okTap: () {
                    controller.getStudentDeletd(
                      studentId: arguments.studentId.toString(),
                    );
                    Get.back();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.delete,
              size: AppDimensions.iconXL,
              color: ShipXColors.error,
            ),
          ),
          AppDimensions.spaceM.w.horizontalSpace,
        ],
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: CustomText(
          text: AppStrings.studentDetails.tr,
          fontSize: AppDimensions.fontL,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Profile Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: Colors.blue.shade50,
                    child: Icon(
                      Icons.person,
                      size: 50.r,
                      color: Colors.blue.shade600,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    arguments.name ?? AppStrings.unknown.tr,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: CustomText(
                      text:
                          "${AppStrings.id.tr}: ${arguments.studentId ?? 'N/A'}  |  ${AppStrings.className.tr}: ${arguments.studentClass ?? 'N/A'}",
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ],
              ),
            ),

            // Detailed Information Sections
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionCard(AppStrings.personalInformation.tr, [
                    _buildInfoRow(AppStrings.dateOfBirth.tr, arguments.dateBirth),
                    _buildInfoRow(AppStrings.gender.tr, arguments.gender),
                    _buildInfoRow(AppStrings.bloodGroup.tr, arguments.bloodGroup),
                    _buildInfoRow(AppStrings.religion.tr, arguments.religion),
                  ]),
                  _buildSectionCard(AppStrings.familyInformation.tr, [
                    _buildInfoRow(AppStrings.fathersName.tr, arguments.fatherName),
                    _buildInfoRow(AppStrings.mothersName.tr, arguments.motherName),
                  ]),
                  _buildSectionCard(AppStrings.contactAndAddress.tr, [
                    _buildInfoRow(AppStrings.studentPhone.tr, arguments.studentNumber),
                    _buildInfoRow(AppStrings.guardianPhone.tr, arguments.guardinNumber),
                    _buildInfoRow(AppStrings.email.tr, arguments.email),
                    _buildInfoRow(AppStrings.address.tr, arguments.address),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontWeight: FontWeight.w700,
          fontSize: AppDimensions.fontL,
        ),

        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Column(children: children),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              (value == null || value.isEmpty) ? 'N/A' : value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
