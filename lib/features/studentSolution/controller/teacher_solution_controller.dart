import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../student/studentSolution/model/student_question_model.dart';
import '../service/teacher_solution_service.dart';

class TeacherSolutionController extends GetxController {
  final service = TeacherSolutionService(supabase: Supabase.instance.client);
  final isLoading = false.obs;
  final questinList = <StudentQuestionModel>[].obs;
  final TextEditingController solutionController = TextEditingController();

  @override
  void onInit() {
    getQuestion();
    super.onInit();
  }

  Future<void> getQuestion() async {
    try {
      isLoading.value = true;
      final response = await service.getQuestion();
      questinList.assignAll(response);
      _showSnackbar("Success", "Questions loaded successfully");
    } catch (e) {
      debugPrint('Error in getQuestion: $e');
      _showSnackbar("Error", "Failed to load questions");
    } finally {
      isLoading.value = false;
    }
  }

  //submit Solution
  Future<void> submitSolution(int questionId) async {
    try {
      if (solutionController.text.isEmpty) {
        _showSnackbar("Error", "Please enter a solution");
        return;
      }

      isLoading.value = true;
      await service.updateSolution(questionId, solutionController.text);
      _showSnackbar("Success", "Solution added successfully");
      solutionController.clear();
      getQuestion(); // Refresh the list
      Get.back(); // Go back to the previous screen
    } catch (e) {
      debugPrint('Error in submitSolution: $e');
      _showSnackbar("Error", "Failed to add solution");
    } finally {
      isLoading.value = false;
    }
  }

  String formatTime(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      final date = DateTime.parse(dateString).toLocal();
      final now = DateTime.now();

      final today = DateTime(now.year, now.month, now.day);
      final aDate = DateTime(date.year, date.month, date.day);

      if (aDate == today) {
        final difference = now.difference(date);
        if (difference.inMinutes < 1) {
          return 'Just now';
        } else if (difference.inHours < 1) {
          return '${difference.inMinutes} Min ago';
        } else {
          return '${difference.inHours} Hr ago';
        }
      }

      final yesterday = today.subtract(const Duration(days: 1));
      if (aDate == yesterday) {
        return 'Yesterday';
      }

      const months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];
      return '${date.day} ${months[date.month - 1]}';
    } catch (e) {
      return '';
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
