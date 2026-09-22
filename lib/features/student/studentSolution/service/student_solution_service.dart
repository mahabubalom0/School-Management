import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/student_question_model.dart';

class StudentSolutionService {
  final SupabaseClient _supabaseClient;
  StudentSolutionService(this._supabaseClient);

  Future<void> addQuestion({
    required String question,
    required String name,
  }) async {
    try {
      await _supabaseClient.from("student_question").insert({
        "question": question,
        "name": name,
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<StudentQuestionModel>> getQuestion() async {
    try {
      final response = await _supabaseClient.from("student_question").select();
      return response.map((e) => StudentQuestionModel.fromJson(e)).toList();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteQuestion(int id) async {
    try {
      await _supabaseClient.from("student_question").delete().eq("id", id);
    } catch (e) {
      throw e.toString();
    }
  }
}
