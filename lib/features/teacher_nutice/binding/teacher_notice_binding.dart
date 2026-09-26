import 'package:get/get.dart';

import '../controller/teacher_notice_controller.dart';


class TeacherNoticeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherNoticeController>(() => TeacherNoticeController());
  }
}
