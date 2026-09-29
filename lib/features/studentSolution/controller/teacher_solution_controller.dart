import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../student/studentSolution/model/student_question_model.dart';
import '../service/teacher_solution_service.dart';

class TeacherSolutionController extends GetxController {
  final service = TeacherSolutionService(supabase: Supabase.instance.client);
  final isLoading = false.obs;
  final questinList = <StudentQuestionModel>[].obs;

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
    } catch (e) {
      e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
