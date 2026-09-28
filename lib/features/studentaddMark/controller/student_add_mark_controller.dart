import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../service/student_mark_service.dart';

class StudentMarkInputItem {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();
  final TextEditingController markController = TextEditingController();

  void dispose() {
    nameController.dispose();
    rollController.dispose();
    markController.dispose();
  }
}

class StudentAddMarkController extends GetxController {
  // Dropdown selections
  final selectedClass = ''.obs;
  final selectedSection = ''.obs;
  final selectedSubject = ''.obs;
  final selectedExam = ''.obs;

  final service = StudentMarkService(supabase: Supabase.instance.client);

  // Options for dropdowns
  final classes = ['1st', '2nd', '3rd', '4th', '5th', '6th', '7th', '8th'];
  final sections = ['A', 'B', 'C'];
  final subjects = ['Mathematics', 'Science', 'English', 'History'];
  final exams = ['First Term', 'Mid Term', 'Final Exam'];

  // Dynamic inputs
  final studentInputs = <StudentMarkInputItem>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    addStudentInput();
  }

  void addStudentInput() {
    studentInputs.add(StudentMarkInputItem());
  }

  void removeStudentInput(int index) {
    if (studentInputs.length > 1) {
      studentInputs[index].dispose();
      studentInputs.removeAt(index);
    }
  }

  @override
  void onClose() {
    for (var input in studentInputs) {
      input.dispose();
    }
    super.onClose();
  }

  // Submit all marks to Supabase
  Future<void> submitMarks() async {
    try {
      isLoading.value = true;
      if (selectedClass.value.isEmpty ||
          selectedSubject.value.isEmpty ||
          selectedSection.value.isEmpty ||
          selectedExam.value.isEmpty) {
        _showSnackbar(
          "Error",
          "Please select class, section, subject and exam",
        );
        return;
      }

      bool hasError = false;

      for (var input in studentInputs) {
        if (input.nameController.text.isEmpty ||
            input.rollController.text.isEmpty ||
            input.markController.text.isEmpty) {
          hasError = true;
          break;
        }
      }

      if (hasError) {
        _showSnackbar("Error", "Please fill all the student fields");
        return;
      }

      for (var input in studentInputs) {
        await service.addMark(
          input.nameController.text,
          input.rollController.text,
          selectedClass.value,
          selectedSection.value,
          selectedSubject.value,
          selectedExam.value,
          input.markController.text,
        );
      }

      _showSnackbar("Success", "Marks added successfully");

      // Reset inputs after successful submission
      for (var input in studentInputs) {
        input.dispose();
      }
      studentInputs.clear();
      addStudentInput();
    } catch (e) {
      debugPrint(e.toString());
      _showSnackbar("Error", "Failed to add mark");
    } finally {
      isLoading.value = false;
    }
  }

  void _showSnackbar(String title, String message) {
    if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!).clearSnackBars();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(
            "$title: $message",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: title == "Error" ? Colors.redAccent : Colors.green,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      debugPrint("Error: Get.context is null. Cannot show snackbar.");
    }
  }
}
