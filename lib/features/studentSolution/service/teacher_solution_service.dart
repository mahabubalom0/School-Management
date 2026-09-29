import 'package:supabase_flutter/supabase_flutter.dart';

import '../../student/studentSolution/model/student_question_model.dart';

class TeacherSolutionService {
  SupabaseClient supabase;
  TeacherSolutionService({required this.supabase});

  Future<List<StudentQuestionModel>> getQuestion() async {
    try {
      final response = await supabase.from('student_questions').select('*');
      return response.map((e) => StudentQuestionModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

 
}
