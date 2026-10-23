import 'package:get/get.dart';

import '../controller/teacher_routine_controller.dart';

class TeacherRoutineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherRoutineController>(() => TeacherRoutineController());
  }
}
