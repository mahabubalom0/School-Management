import 'package:get/get.dart';

class StudentModel {
  String id;
  String name;
  RxBool isPresent;
  RxBool isAbsent;

  StudentModel({
    required this.id,
    required this.name,
    bool present = false,
    bool absent = false,
  }) : isPresent = present.obs,
       isAbsent = absent.obs;
}
