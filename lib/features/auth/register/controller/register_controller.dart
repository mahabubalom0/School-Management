import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../routes/app_routes.dart';
import '../../service/register_service.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final classController = TextEditingController();
  final sectionController = TextEditingController();
  final rollNoController = TextEditingController();
  final groupController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();
  final RxBool isLoading = false.obs;
  final _supabasewClient = RegisterService(Supabase.instance.client);

  final genderOptions = <String>['Male', 'Female', 'Other'];

  void handleRegistration() async {
    try {
      isLoading.value = true;
      if (nameController.text.isEmpty) {
        showErrorSnackbar("Please enter your name");
      } else if (emailController.text.isEmpty) {
        showErrorSnackbar("Please enter your email");
      } else if (passwordController.text.isEmpty) {
        showErrorSnackbar("Please enter your password");
      } else if (passwordController.text.length < 8) {
        showErrorSnackbar("Password must be at least 8 characters");
      } else if (classController.text.isEmpty) {
        showErrorSnackbar("Please enter your class");
      } else if (sectionController.text.isEmpty) {
        showErrorSnackbar("Please enter your section");
      } else if (rollNoController.text.isEmpty) {
        showErrorSnackbar("Please enter your roll no");
      } else if (groupController.text.isEmpty) {
        showErrorSnackbar("Please enter your group");
      } else if (addressController.text.isEmpty) {
        showErrorSnackbar("Please enter your address");
      } else if (genderController.text.isEmpty) {
        showErrorSnackbar("Please enter your gender");
      } else {
        final response = await _supabasewClient.signUpUser(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          name: nameController.text.trim(),
          className: classController.text.trim(),
          section: sectionController.text.trim(),
          rollNo: rollNoController.text.trim(),
          group: groupController.text.trim(),
          address: addressController.text.trim(),
          gender: genderController.text.trim(),
        );
        if (response.session != null) {
          showErrorSnackbar("Success");
        }
        showErrorSnackbar("Succes application");
        clearTextField();
        Get.toNamed(AppRoutes.login);
      }
    } catch (e) {
      e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void clearTextField() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    classController.clear();
    sectionController.clear();
    rollNoController.clear();
    groupController.clear();
    addressController.clear();
    genderController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    classController.dispose();
    sectionController.dispose();
    rollNoController.dispose();
    groupController.dispose();
    addressController.dispose();
    genderController.dispose();
    super.onClose();
  }

  void showErrorSnackbar(String message) {
    if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(message, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
