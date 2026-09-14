import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/all_student_model.dart';

class AllStudentService {
  SupabaseClient _supabaseClient;
  AllStudentService(this._supabaseClient);

  Future<List<AllStudentModel>> getAllStudent() async {
    try {
      final response = await _supabaseClient.from("student_list").select("*");
      if (response.isEmpty) {
        throw Exception("No student found");
      }
      return (response as List<dynamic>)
          .map((e) => AllStudentModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> getStudentDeletd({required String studentId}) async {
    try {
      await _supabaseClient.from("student_list").delete().eq("student_id", studentId);
      return;
    } catch (e) {
      throw e.toString();
    }
  }
}
