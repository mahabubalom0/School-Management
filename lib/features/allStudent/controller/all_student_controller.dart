import 'package:get/get.dart';

class AllStudentController extends GetxController {
  final List<String> semesterName = [
    "All Student",
    "1st",
    "2nd",
    "3rd",
    "4th",
    "5th",
    "6th",
    "7th",
    "8th",
  ];
  final RxInt selectedSemesterIndex = 0.obs;
}
