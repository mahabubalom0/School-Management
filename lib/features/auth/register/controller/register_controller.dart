import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/core.dart';
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
        showErrorSnackbar(AppStrings.pleaseEnterName.tr);
      } else if (emailController.text.isEmpty) {
        showErrorSnackbar(AppStrings.pleaseEnterEmail.tr);
      } else if (passwordController.text.isEmpty) {
        showErrorSnackbar(AppStrings.pleaseEnterPassword.tr);
      } else if (passwordController.text.length < 8) {
        showErrorSnackbar(AppStrings.passwordMinLength.tr);
      } else if (classController.text.isEmpty) {
        showErrorSnackbar(AppStrings.pleaseEnterClass.tr);
      } else if (sectionController.text.isEmpty) {
        showErrorSnackbar(AppStrings.pleaseEnterSection.tr);
      } else if (rollNoController.text.isEmpty) {
        showErrorSnackbar(AppStrings.pleaseEnterRollNo.tr);
      } else if (groupController.text.isEmpty) {
        showErrorSnackbar(AppStrings.pleaseEnterGroup.tr);
      } else if (addressController.text.isEmpty) {
        showErrorSnackbar(AppStrings.pleaseEnterAddress.tr);
      } else if (genderController.text.isEmpty) {
        showErrorSnackbar(AppStrings.pleaseEnterGender.tr);
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
          showErrorSnackbar(AppStrings.success.tr);
        }
        showErrorSnackbar(AppStrings.registrationSuccess.tr);
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
