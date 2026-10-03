import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/student_show_model.dart';
import '../service/student_show_service.dart';

class TeacherResultController extends GetxController {
  final service = StudentShowService(supabaseClient: Supabase.instance.client);

  final RxBool isLoading = false.obs;
  final RxList<StudentShowModel> studentResult = <StudentShowModel>[].obs;
  Future<void> getStudentResult() async {
    try {
      isLoading.value = true;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = true;
    }
  }
}
