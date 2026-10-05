import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/student_show_model.dart';
import '../service/student_show_service.dart';

class TeacherResultController extends GetxController {
  final service = StudentShowService(supabaseClient: Supabase.instance.client);

  final RxBool isLoading = false.obs;
  final RxList<StudentShowModel> studentResult = <StudentShowModel>[].obs;
  final searchCLT=TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getAllStudentResult();
  }

  Future<void> getAllStudentResult() async {
    try {
      isLoading.value = true;
      debugPrint("Fetching all student results...");
      final response = await service.getAllResult();
      debugPrint("Fetched ${response.length} results successfully.");
      studentResult.assignAll(response);
    } catch (e, stacktrace) {
      debugPrint("Error fetching results: $e");
      debugPrint("Stacktrace: $stacktrace");
      showSnackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> getStudentResult(
  //   String classID,
  //   String sectionID,
  //   String examID,
  // ) async {
  //   try {
  //     isLoading.value = true;
  //     final response = await service.getResult(classID, sectionID, examID);
  //     studentResult.assignAll(response);
  //     showSnackbar("Success", "Student Result Fetched Successfully");
  //   } catch (e) {
  //     showSnackbar("Error", e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

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
}
