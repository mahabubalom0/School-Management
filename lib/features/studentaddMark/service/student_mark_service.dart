import 'package:supabase_flutter/supabase_flutter.dart';

class StudentMarkService {
  final SupabaseClient supabase;
  StudentMarkService({required this.supabase});
  Future<void> addMark(
    String name,
    String roll,
    String classs,
    String section,
    String subject,
    String exam,
    String mark,
  ) async {
    await supabase.from('student_result ').insert({
      'name': name,
      'roll': roll,
      'class': classs,
      'section': section,
      'subject': subject,
      'exam': exam,
      'mark': mark,
    });
  }
}
