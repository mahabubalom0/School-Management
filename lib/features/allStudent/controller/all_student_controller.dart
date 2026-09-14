
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/all_student_model.dart';
import '../service/all_student_service.dart';

class AllStudentController extends GetxController {
  final AllStudentService studentService=AllStudentService(Supabase.instance.client);
  final RxList<AllStudentModel> allStudentList=RxList<AllStudentModel>();
  final RxBool isLoading=false.obs;
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
  @override
  void onInit() {
    super.onInit();
    getAllStudent();
  }
  Future<void>getAllStudent()async{
  try{
    isLoading.value=true;
    final allStudent=await studentService.getAllStudent();
    allStudentList.assignAll(allStudent);
  _showSnackbar("Success", "All student fetched successfully");
  }catch(e){
    _showSnackbar('Error', e.toString());
  }finally{
    isLoading.value=false;
  }
  }
   void _showSnackbar(String title, String message) {
    if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!).clearSnackBars();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text("$title: $message", style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      print("Error: Get.context is null. Cannot show snackbar.");
    }
  }
}
