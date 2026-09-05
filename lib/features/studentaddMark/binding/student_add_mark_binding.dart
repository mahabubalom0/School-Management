import 'package:get/get.dart';

import '../controller/student_add_mark_controller.dart';

class StudentAddMarkBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentAddMarkController>(() => StudentAddMarkController());
  }
}
