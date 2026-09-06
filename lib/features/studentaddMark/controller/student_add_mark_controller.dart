import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/student_mark_model';



class StudentAddMarkController extends GetxController {
  // Dropdown selections
  final selectedClass = ''.obs;
  final selectedSection = ''.obs;
  final selectedSubject = ''.obs;
  final selectedExam = ''.obs;

  // Options for dropdowns
  final classes = ['Class 1', 'Class 2', 'Class 3', 'Class 4', 'Class 5'];
  final sections = ['A', 'B', 'C'];
  final subjects = ['Mathematics', 'Science', 'English', 'History'];
  final exams = ['First Term', 'Mid Term', 'Final Exam'];

  // Students list
  final students = <StudentMarkModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Load some dummy students initially
    _loadDummyStudents();
  }

  void _loadDummyStudents() {
    students.value = [
      StudentMarkModel(id: '1', name: 'John Doe', rollNumber: '101'),
      StudentMarkModel(id: '2', name: 'Jane Smith', rollNumber: '102'),
      StudentMarkModel(id: '3', name: 'Alice Johnson', rollNumber: '103'),
      StudentMarkModel(id: '4', name: 'Bob Brown', rollNumber: '104'),
    ];
  }

  // Update mark in the list
  void updateMark(String studentId, String newMark) {
    final index = students.indexWhere((s) => s.id == studentId);
    if (index != -1) {
      students[index].mark = newMark;
    }
  }

  // Submit data to Supabase (Mocked for now)
  void submitMarks() {
    if (selectedClass.value.isEmpty || selectedSubject.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Please select class and subject first',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
      );
      return;
    }

    // Here we will eventually send the data to Supabase
    debugPrint('Submitting marks to Supabase...');
    for (var student in students) {
      debugPrint('Student: ${student.name}, Mark: ${student.mark}');
    }
    
    Get.snackbar(
      'Success',
      'Marks saved successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade600,
      colorText: Colors.white,
    );
  }
}