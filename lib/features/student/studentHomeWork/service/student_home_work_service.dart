import '../model/home_work_model.dart';
import 'package:supabase/supabase.dart';

class StudentHomeWorkService {
  final SupabaseClient client;
  StudentHomeWorkService({required this.client});

  Future<List<HomeWorkModel>> studentHomeWorkService() async {
    try {
      final res = await client.from("teacher_homework").select('*');
      return res.map<HomeWorkModel>((e) => HomeWorkModel.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
