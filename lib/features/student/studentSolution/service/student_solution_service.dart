import 'package:supabase_flutter/supabase_flutter.dart';

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
}
