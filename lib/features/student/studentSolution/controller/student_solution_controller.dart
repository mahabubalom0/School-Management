import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/student_question_model.dart';
import '../service/student_solution_service.dart';

class StudentSolutionController extends GetxController {
  final questionController = TextEditingController();
  final StudentSolutionService service = StudentSolutionService(
    Supabase.instance.client,
  );
  final user = Supabase.instance.client.auth.currentUser;
  final isLoading = false.obs;
  RxList<StudentQuestionModel> questionsList = RxList<StudentQuestionModel>();

  @override
  void onInit() {
    super.onInit();
    getQuestions();
  }

  Future<void> askQuestion() async {
    if (questionController.text.trim().isEmpty) {
      _showSnackbar("Error", "Please enter a question");
      return;
    }
    if (user == null) {
      _showSnackbar("Error", "You are not logged in");
      return;
    }
    try {
      isLoading.value = true;
      await service.addQuestion(
        question: questionController.text,
        name: user!.email ?? "Unknown",
      );
      _showSnackbar("Success", "Question added successfully");
      questionController.clear();
      getQuestions();
      Get.back();
    } catch (e) {
      _showSnackbar("Error", e.toString());
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getQuestions() async {
    try {
      isLoading.value = true;
      final response = await service.getQuestion();
      if (response.isNotEmpty) {
        questionsList.assignAll(response);
      }
    } catch (e) {
      _showSnackbar("Error", e.toString());
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> deleteQuestion(int id) async {
    try {
      await service.deleteQuestion(id);
      questionsList.removeWhere((element) => element.id == id);
      _showSnackbar("Success", "Question deleted successfully");
      return true;
    } catch (e) {
      _showSnackbar("Error", e.toString());
      debugPrint(e.toString());
      return false;
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
