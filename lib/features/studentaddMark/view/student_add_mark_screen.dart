import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../controller/student_add_mark_controller.dart';
import '../widgets/dropdown_selector.dart';
import '../widgets/student_mark_tile.dart';

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
        backgroundColor: ShipXColors.primary,
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
                        child: Obx(
                          () => DropdownSelector(
                            label: 'Class',
                            hint: 'Select Class',
                            value: controller.selectedClass.value,
                            items: controller.classes,
                            onChanged: (val) {
                              if (val != null) {
                                controller.selectedClass.value = val;
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Obx(
                          () => DropdownSelector(
                            label: 'Section',
                            hint: 'Select Section',
                            value: controller.selectedSection.value,
                            items: controller.sections,
                            onChanged: (val) {
                              if (val != null) {
                                controller.selectedSection.value = val;
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => DropdownSelector(
                            label: 'Subject',
                            hint: 'Select Subject',
                            value: controller.selectedSubject.value,
                            items: controller.subjects,
                            onChanged: (val) {
                              if (val != null) {
                                controller.selectedSubject.value = val;
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Obx(
                          () => DropdownSelector(
                            label: 'Exam',
                            hint: 'Select Exam',
                            value: controller.selectedExam.value,
                            items: controller.exams,
                            onChanged: (val) {
                              if (val != null) {
                                controller.selectedExam.value = val;
                              }
                            },
                          ),
                        ),
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
                  Obx(
                    () => Text(
                      '${controller.studentInputs.length} Students',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Students List
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.studentInputs.isEmpty) {
                  return Center(
                    child: Text(
                      'No students found',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.studentInputs.length + 1,
                  itemBuilder: (context, index) {
                    if (index == controller.studentInputs.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              controller.addStudentInput();
                            },
                            icon: const Icon(Icons.add),
                            label: const Text("Add Another Student"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade50,
                              foregroundColor: Colors.blue.shade800,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    final inputItem = controller.studentInputs[index];
                    return StudentMarkTile(
                      name: inputItem.nameController,
                      rollNumber: inputItem.rollController,
                      initialMark: inputItem.markController,
                      onMarkChanged: (val) {},
                      deleteOnTap: () {
                        controller.removeStudentInput(index);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppDimensions.paddingXL.w,
          right: AppDimensions.paddingXL.w,
          bottom: AppDimensions.paddingHUGE.h,
        ),
        child: CustomButton(
          text: "Save Marks",
          onPressed: () {
            controller.submitMarks();
          },
        ),
      ),
    );
  }
}
