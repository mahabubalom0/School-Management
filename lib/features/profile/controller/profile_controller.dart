import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_routes.dart';
import '../../auth/service/login_service.dart';

class ProfileController extends GetxController {
  final LoginService loginService = LoginService(Supabase.instance.client);
  final isLoading = false.obs;

  Future<void> logout() async {
    try {
      isLoading.value = true;
      await loginService.logout();
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
