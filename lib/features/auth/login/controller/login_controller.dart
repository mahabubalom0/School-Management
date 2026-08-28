import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/storage/storage_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../../routes/app_routes.dart';

class LoginController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final rememberMe = false.obs;
  final isObscure = true.obs;

  void onToggleObscure() => isObscure.toggle();
  void onToggleRemember(bool? value) => rememberMe.value = value ?? false;

  Future<void> login() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      _showSnackbar(AppStrings.loginError.tr, AppStrings.fillFields.tr);
      return;
    }
    isLoading.value = true;

    try {
      Get.offAllNamed(AppRoutes.main);
    } catch (e) {
      _showSnackbar(AppStrings.error.tr, e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void _showSnackbar(String title, String message) {
    AppSnackbar.error(
      title: title,
      message: message,
      position: SnackbarPosition.bottom,
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
