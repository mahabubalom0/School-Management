import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/student_add_mark_controller.dart';
import 'widgets/dropdown_selector.dart';
import 'widgets/student_mark_tile.dart';

class StudentAddMarkScreen extends StatelessWidget {
  const StudentAddMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentAddMarkController());

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Add Student Marks',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Filters Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => DropdownSelector(
                              label: 'Class',
                              hint: 'Select Class',
                              value: controller.selectedClass.value,
                              items: controller.classes,
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedClass.value = val;
                                }
                              },
                            )),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Obx(() => DropdownSelector(
                              label: 'Section',
                              hint: 'Select Section',
                              value: controller.selectedSection.value,
                              items: controller.sections,
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedSection.value = val;
                                }
                              },
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => DropdownSelector(
                              label: 'Subject',
                              hint: 'Select Subject',
                              value: controller.selectedSubject.value,
                              items: controller.subjects,
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedSubject.value = val;
                                }
                              },
                            )),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Obx(() => DropdownSelector(
                              label: 'Exam',
                              hint: 'Select Exam',
                              value: controller.selectedExam.value,
                              items: controller.exams,
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedExam.value = val;
                                }
                              },
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Student List Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Student List',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  Obx(() => Text(
                    '${controller.students.length} Students',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  )),
                ],
              ),
            ),

            // Students List
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                if (controller.students.isEmpty) {
                  return Center(
                    child: Text(
                      'No students found',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.students.length,
                  itemBuilder: (context, index) {
                    final student = controller.students[index];
                    return StudentMarkTile(
                      name: student.name,
                      rollNumber: student.rollNumber,
                      initialMark: student.mark,
                      onMarkChanged: (val) {
                        controller.updateMark(student.id, val);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, -4),
              blurRadius: 10,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: controller.submitMarks,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade700,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Save Marks',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}