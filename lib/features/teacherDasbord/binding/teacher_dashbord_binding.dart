import 'package:get/get.dart';

import '../controller/teacher_dashbord_controller.dart';

class TeacherDashbordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherDashbordController>(() => TeacherDashbordController());
  }
}
