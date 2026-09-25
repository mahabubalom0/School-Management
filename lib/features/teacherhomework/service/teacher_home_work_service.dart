import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TeacherHomeWorkService {
  SupabaseClient supabaseClient;
  TeacherHomeWorkService(this.supabaseClient);

  Future<void> homewokuploadservice({
    required String classname,
    required String section,
    required String subject,
    required String homework,
  }) async {
    try {
      await supabaseClient.from("teacher_homework").insert({
        "class": classname,
        "section": section,
        "subject": subject,
        "addHomework": homework,
      });
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }
}
