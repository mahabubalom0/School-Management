import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/widgets/custom_text.dart';
import '../model/all_student_model.dart';

class StudentDeatilesView extends StatelessWidget {
  const StudentDeatilesView({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as AllStudentModel;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const CustomText(
          text: "Student Details",
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
                    arguments.name ?? 'Unknown Name',
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
                          "ID: ${arguments.studentId ?? 'N/A'}  |  Class: ${arguments.studentClass ?? 'N/A'}",
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
                  _buildSectionCard("Personal Information", [
                    _buildInfoRow("Date of Birth", arguments.dateBirth),
                    _buildInfoRow("Gender", arguments.gender),
                    _buildInfoRow("Blood Group", arguments.bloodGroup),
                    _buildInfoRow("Religion", arguments.religion),
                  ]),
                  _buildSectionCard("Family Information", [
                    _buildInfoRow("Father's Name", arguments.fatherName),
                    _buildInfoRow("Mother's Name", arguments.motherName),
                  ]),
                  _buildSectionCard("Contact & Address", [
                    _buildInfoRow("Student Phone", arguments.studentNumber),
                    _buildInfoRow("Guardian Phone", arguments.guardinNumber),
                    _buildInfoRow("Email", arguments.email),
                    _buildInfoRow("Address", arguments.address),
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
