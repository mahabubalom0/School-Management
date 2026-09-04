import 'package:get/get.dart';

class StudentHomeWorkController extends GetxController {
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
 void submitButton() {
  Get.snackbar("Success", "Homework submitted successfully!");
 }
}
