import 'package:get/get.dart';
import '../controller/teacher_solution_controller.dart';

class TeacherSolutionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherSolutionController>(() => TeacherSolutionController());
  }
}
