import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../model/student_show_model.dart';

class ResultDeatils extends StatelessWidget {
  const ResultDeatils({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    final String className = args["class"] ?? "Unknown Class";
    final String exam = args["exam"] ?? "Unknown Exam";
    final List<StudentShowModel> students = args["students"] ?? [];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: CustomText(
          text: "$className - $exam",
          fontSize: AppDimensions.fontL,
          color: ShipXColors.deepBlue,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(
              left: AppDimensions.paddingXL.w,
              right: AppDimensions.paddingXL.w,
              top: AppDimensions.paddingXL.h,
            ),
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 61, 47, 47),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: CustomTextField(
                controller: TextEditingController(),
                hintText: "Search",
              ),
            ),
          ),
          Expanded(
            child: students.isEmpty
                ? const Center(
                    child: Text(
                      "No results found.",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: students.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final studentResult = students[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: _buildStudentCard(studentResult),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentCard(StudentShowModel studentResult) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blue.shade100,
            child: Text(
              studentResult.name?.isNotEmpty == true
                  ? studentResult.name![0].toUpperCase()
                  : "?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
          ),
          title: CustomText(
            text: studentResult.name ?? "Name Not Found",
            fontSize: AppDimensions.fontL,
            color: ShipXColors.white,
            fontWeight: FontWeight.bold,
          ),
          subtitle: CustomText(
            text:
                "Roll: ${studentResult.roll ?? 'N/A'} | ID: ${studentResult.id ?? 'N/A'}",
            fontSize: AppDimensions.font13,
            color: ShipXColors.white,
            fontWeight: FontWeight.bold,
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.shade500,
              borderRadius: BorderRadius.circular(12),
            ),
            child: CustomText(
              text: "GPA: ${studentResult.mark?.toString() ?? "0"}",
              fontSize: AppDimensions.font13,
              color: ShipXColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  const Divider(),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    Icons.book_outlined,
                    "Subject",
                    studentResult.subject ?? "N/A",
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    Icons.group_outlined,
                    "Section",
                    studentResult.section ?? "N/A",
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    Icons.class_outlined,
                    "Class",
                    studentResult.className ?? "N/A",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.blue.shade700),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
