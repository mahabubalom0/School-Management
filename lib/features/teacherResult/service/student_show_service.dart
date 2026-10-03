import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/student_show_model.dart';

class StudentShowService {
  final SupabaseClient supabaseClient;

  StudentShowService({required this.supabaseClient});
  Future<List<StudentShowModel>> getResult(
    String classID,
    String sectionID,
    String examID,
  ) async {
    final responce = await supabaseClient
        .from("student_result")
        .select()
        .eq("class", classID)
        .eq("section", sectionID)
        .eq("exam", examID);
    return responce.map((x) => StudentShowModel.fromJson(x)).toList();
  }
}
