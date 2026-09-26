import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../service/techer_notice_service.dart';

class TeacherNoticeController extends GetxController {
  final nameController = TextEditingController();
  final professionController = TextEditingController();
  final noticeController = TextEditingController();

  final RxBool isLoading = false.obs;

  final TeacherNoticeService service = TeacherNoticeService(
    supabaseClient: Supabase.instance.client,
  );

  Future<void> getSendNotice() async {
    try {
      if (nameController.text.isEmpty) {
        _showSnackbar("Error", "Please enter your name");
        return;
      }
      if (professionController.text.isEmpty) {
        _showSnackbar("Error", "Please enter your profession");
        return;
      }
      if (noticeController.text.isEmpty) {
        _showSnackbar("Error", "Please enter your notice");
        return;
      }
      isLoading.value = true;
      await service.sendNotice(
        name: nameController.text,
        profession: professionController.text,
        notice: noticeController.text,
      );
      nameController.clear();
      professionController.clear();
      noticeController.clear();
      Get.back();
      _showSnackbar("Success", "Notice sent successfully!");
    } catch (e) {
      _showSnackbar("Error", "Notice sending failed!");
    } finally {
      isLoading.value = false;
    }
  }

  void _showSnackbar(String title, String message) {
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
