import 'package:get/get.dart';
import '../controller/teacher_home_work_controller.dart';

class TeacherHomeworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherHomeWorkController>(() => TeacherHomeWorkController());
  }
}
