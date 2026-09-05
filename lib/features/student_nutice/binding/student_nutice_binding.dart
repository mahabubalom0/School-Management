import 'package:get/get.dart';

import '../controller/student_nutice_controller.dart';

class StudentNuticeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentNuticeController>(() => StudentNuticeController());
  }
}
