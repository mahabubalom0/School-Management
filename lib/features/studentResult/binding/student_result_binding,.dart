import 'package:get/get.dart';

import '../controller/student_result_controller.dart';

class StudentResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentResultController>(() => StudentResultController());
  }
}
