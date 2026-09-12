import 'package:get/get.dart';

import '../controller/add_ account_controller.dart';

class AddAccountBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<AddAccountController>(() => AddAccountController());
  }

}