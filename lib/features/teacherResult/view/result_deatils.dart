import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../controller/teacher_result_controller.dart';
import '../model/student_show_model.dart';

class ResultDeatils extends StatefulWidget {
  const ResultDeatils({super.key});

  @override
  State<ResultDeatils> createState() => _ResultDeatilsState();
}

class _ResultDeatilsState extends State<ResultDeatils> {
  late List<StudentShowModel> allStudents;
  late List<StudentShowModel> filteredStudents;
  late String className;
  late String exam;
  final controller = Get.find<TeacherResultController>();

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    className = args["class"] ?? "Unknown Class";
    exam = args["exam"] ?? "Unknown Exam";
    allStudents = args["students"] ?? [];
    filteredStudents = allStudents;

    // Clear search controller when screen opens
    controller.searchCLT.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<StudentShowModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = allStudents;
    } else {
      results = allStudents
          .where(
            (student) => student.roll.toString().toLowerCase().contains(
              enteredKeyword.toLowerCase(),
            ),
          )
          .toList();
    }

    setState(() {
      filteredStudents = results;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getAllStudentResult();
        },
        child: Column(
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
                  controller: controller.searchCLT,
                  hintText: "Search by roll no",
                  onchange: (d) => _runFilter(d),
                ),
              ),
            ),
            Expanded(
              child: filteredStudents.isEmpty
                  ? const Center(
                      child: Text(
                        "No results found.",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: filteredStudents.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final studentResult = filteredStudents[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: _buildStudentCard(studentResult),
                        );
                      },
                    ),
            ),
          ],
        ),
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
            color: ShipXColors.background,
          ),
        ),
      ],
    );
  }
}
