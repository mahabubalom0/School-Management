import 'package:get/get.dart';
import '../../../core/storage/storage_service.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();

  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    // Standard delay for splash screen visibility
    await Future.delayed(const Duration(seconds:3));

    final token = await _storageService.getAccessToken();
    final hasOnboarded = _storageService.hasOnboarded();

    if (token != null && token.isNotEmpty) {
      Get.offAllNamed(AppRoutes.main);
    } else {
      if (hasOnboarded) {
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.offAllNamed(AppRoutes.onboarding);
      }
    }
  }
}
