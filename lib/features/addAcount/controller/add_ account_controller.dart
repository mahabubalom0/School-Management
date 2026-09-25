
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../service/add_student_service.dart';

class AddAccountController extends GetxController {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final studentRoolClt = TextEditingController();
  final studentGenderClt = TextEditingController();
  final classAdmissionController = TextEditingController();
  final fatherNameController = TextEditingController();
  final motherNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final religionController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final gradientPhoneNumberClt = TextEditingController();
  final studentPhoneClt = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final RxBool isLoading = false.obs;

  final gender = ["Male", "Female", "Other"];
  final religion = ["Islam", "Hindu", "Christian", "Buddhist", "Other"];
  final bloodGroup = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];
  final supabseService = AddStudentService(Supabase.instance.client);

  Future<void> addStudent() async {
    try {
      isLoading.value = true;
      final response = await supabseService.addStudent(
        name: nameController.text,
        email: emailController.text,
        studentRool: studentRoolClt.text,
        studentGender: studentGenderClt.text,
        classAdmission: classAdmissionController.text,
        fatherName: fatherNameController.text,
        motherName: motherNameController.text,
        dateOfBirth: dateOfBirthController.text,
        religion: religionController.text,
        bloodGroup: bloodGroupController.text,
        gradientPhoneNumber: gradientPhoneNumberClt.text,
        studentPhone: studentPhoneClt.text,
        address: addressController.text,
      );
      if (response == null) {
        debugPrint("SUPABASE ERROR: ttt");
      }

      close();
      Get.back();
    } catch (e) {
      debugPrint("SUPABASE ERROR: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void close() {
    nameController.clear();
    emailController.clear();
    emailController.clear();
    studentRoolClt.clear();
    studentGenderClt.clear();
    classAdmissionController.clear();
    fatherNameController.clear();
    motherNameController.clear();
    dateOfBirthController.clear();
    religionController.clear();
    bloodGroupController.clear();
    gradientPhoneNumberClt.clear();
    studentPhoneClt.clear();
    phoneController.clear();
    addressController.clear();
  }

  @override
  void onInit() {
    super.onInit();
    gender.sort();
    religion.sort();
    bloodGroup.sort();
  }
}
