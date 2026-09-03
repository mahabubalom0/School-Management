import 'package:get/get.dart';

import '../controller/student_attendance_controller.dart';

class StudentAttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentAttendanceController>(
      () => StudentAttendanceController(),
    );
  }
}
