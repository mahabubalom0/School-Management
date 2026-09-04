import 'package:get/get.dart';
import '../controller/student_home_work_controller.dart';

class StudentHomeworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentHomeWorkController>(() => StudentHomeWorkController());
  }
}
