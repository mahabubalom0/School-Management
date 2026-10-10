import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/home_work_model.dart';
import '../service/student_home_work_service.dart';

class StudentHomeWorkController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList homeWorkModel = <HomeWorkModel>[].obs;
  final service = StudentHomeWorkService(client: Supabase.instance.client);

  Future<void> getStudentHomeWork() async {
    try {
      isLoading.value = true;
      final res = await service.studentHomeWorkService();
      homeWorkModel.value = res;
      showSnackbar('Success', 'Student Home Work Loaded Successfully');
      debugPrint(
        "Student Home Work Loaded Successfully ${homeWorkModel.length}",
      );
    } catch (e) {
      showSnackbar('Error', e.toString());
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return "No Date";
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return "${date.day} ${months[date.month - 1]} ${date.year}";
  }

  

  void showSnackbar(String title, String message) {
    if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!).clearSnackBars();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(
            "$title: $message",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      debugPrint("Error: Get.context is null. Cannot show snackbar.");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getStudentHomeWork();
  }
}
