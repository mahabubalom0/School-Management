import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  final supabase = Supabase.instance.client;

  void getStudent() async {
    final isLoggedIn = supabase.auth.currentSession != null;

    if (isLoggedIn) {
      Get.offAllNamed(AppRoutes.studentDashbord);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
