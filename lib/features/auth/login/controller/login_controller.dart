import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../../routes/app_routes.dart';
import '../../service/login_service.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final loginService = LoginService(Supabase.instance.client);

  final isLoading = false.obs;
  final rememberMe = false.obs;
  final isObscure = true.obs;

  void onToggleObscure() => isObscure.toggle();
  void onToggleRemember(bool? value) => rememberMe.value = value ?? false;

  Future<void> login() async {
    if (usernameController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      _showSnackbar(AppStrings.loginError.tr, AppStrings.fillFields.tr);
      return;
    }
    isLoading.value = true;

    try {
      final authResponse = await loginService.login(
        email: usernameController.text.trim(),
        password: passwordController.text,
      );
      if (authResponse.session != null) {
        Get.offAllNamed(AppRoutes.main);
      }
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
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
