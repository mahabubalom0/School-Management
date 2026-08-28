import 'package:get/get.dart';
import '../../../core/storage/storage_service.dart';
import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();

  // Function to complete onboarding and go to Login
  Future<void> navigateToLogin() async {
    // await _storageService.setOnboarded();
    Get.offAllNamed(AppRoutes.login);
  }

  // Function to complete onboarding and go to Login
  Future<void> navigateToRegister() async {
    // await _storageService.setOnboarded();
    Get.offAllNamed(AppRoutes.login);
  }
}
