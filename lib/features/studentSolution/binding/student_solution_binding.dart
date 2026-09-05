import 'package:get/get.dart';
import '../controller/student_solution_controller.dart';

class StudentSolutionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentSolutionController>(() => StudentSolutionController());
  }
}
