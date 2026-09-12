import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAccountController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final emailAddressClt = TextEditingController();
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

  final gender = ["Male", "Female", "Other"];
  final religion = ["Islam", "Hindu", "Christian", "Buddhist", "Other"];
  final bloodGroup = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];

  @override
  void onInit() {
    super.onInit();
    gender.sort();
    religion.sort();
    bloodGroup.sort();
  }
}
