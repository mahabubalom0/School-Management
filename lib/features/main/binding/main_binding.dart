import 'package:get/get.dart';
import '../controller/main_controller.dart';
import '../../home/controller/home_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());

    Get.lazyPut<HomeController>(() => HomeController());
  }
}
