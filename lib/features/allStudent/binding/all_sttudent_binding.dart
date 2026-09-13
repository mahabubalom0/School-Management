import 'package:get/get.dart';

import '../controller/all_student_controller.dart';

class AllSttudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllStudentController>(() => AllStudentController());
  }
}
