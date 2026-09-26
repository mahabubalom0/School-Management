import 'package:supabase_flutter/supabase_flutter.dart';

class TeacherNoticeService {
  SupabaseClient supabaseClient;
  TeacherNoticeService({required this.supabaseClient});
  Future<void> sendNotice({
    required String name,
    required String profession,
    required String notice,
  }) async {
    final response = await supabaseClient.from("notice").insert({
      "name": name,
      "profession": profession,
      "notice": notice,
    });
    return response;
  }
}
