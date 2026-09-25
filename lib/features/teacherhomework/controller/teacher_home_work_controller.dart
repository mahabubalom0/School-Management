import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../service/teacher_home_work_service.dart';

class TeacherHomeWorkController extends GetxController {
  final addHomeWorkClt = TextEditingController();
  String selectedClass = "Select Class";
  String selectedSection = "Select Section";
  String selectedSubject = "Select Subject";
  final RxBool isloading = false.obs;
  final TeacherHomeWorkService service = TeacherHomeWorkService(
    Supabase.instance.client,
  );
  final List<String> classList = [
    "Fast Semister",
    "Second Semister",
    "Third Semister",
    "Fourth Semister",
    "Fifth Semister",
    "Sixth Semister",
    "Seventh Semister",
    "Eighth Semister",
  ];

  final List<String> sectionsList = ["A", "B", "C"];
  final List<String> subjectsList = [
    "Bangla",
    "English",
    "Mathematics-1",
    "Mathematics-2",
    "Mathematics-3",
    "Physics-1",
    "Physics-2",
    "Chemistry",
    "Computer Application",
    "Engineering Drawing",
    "Electrical Engineering Fundamentals",
    "Basic Electronics",
    "Civil Engineering Materials",
    "Mechanical Engineering Materials",
    "Programming in C",
    "Data Structure & Algorithm",
    "Object Oriented Programming",
    "Database Management System",
    "Web Development",
    "Software Engineering",
    "Network Administration",
    "Microcontroller & Embedded System",
    "Surveying",
    "Theory of Structure",
    "Estimating & Costing",
    "Transportation Engineering",
    "Electrical Circuits",
    "Electrical Machines",
    "Power System",
    "Thermodynamics",
    "Fluid Mechanics",
    "Machine Design",
    "Industrial Management",
    "Business Organization & Communication",
  ];
  Future<void> submitButton() async {
    try {
      isloading.value = true;
      if (addHomeWorkClt.text.isEmpty) {
        _showSnackbar("Error", "Please enter homework");
        return;
      }
      if (selectedClass == "Select Class") {
        _showSnackbar("Error", "Please select Class");
        return;
      }
      if (selectedSection == "Select Section") {
        _showSnackbar("Error", "Please select Section");
        return;
      }
      if (selectedSubject == "Select Subject") {
        _showSnackbar("Error", "Please select Subject");
        return;
      }
      await service.homewokuploadservice(
        classname: selectedClass,
        section: selectedSection,
        subject: selectedSubject,
        homework: addHomeWorkClt.text,
      );
      _showSnackbar("Success", "Homework submitted successfully!");
      Get.back();
      addHomeWorkClt.clear();
    } catch (e) {
      _showSnackbar("Error", "Homework submission failed!");
    } finally {
      isloading.value = false;
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
          backgroundColor: Colors.redAccent,
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
