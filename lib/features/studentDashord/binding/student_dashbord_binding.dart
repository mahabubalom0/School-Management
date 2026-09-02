import 'package:get/get.dart';

import '../controller/student_dashbord_controller.dart';

class StudentDashbordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentDashbordController>(() => StudentDashbordController());
  }
}
