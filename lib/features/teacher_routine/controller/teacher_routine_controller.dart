import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../model/routine_item_model.dart';

class TeacherRoutineController extends GetxController {
  final RxList<RoutineItemModel> routineList = <RoutineItemModel>[].obs;

  /// 7 Days of the week (Localization keys)
  final List<String> days = [
    AppStrings.saturday,
    AppStrings.sunday,
    AppStrings.monday,
    AppStrings.tuesday,
    AppStrings.wednesday,
    AppStrings.thursday,
    AppStrings.friday,
  ];

  @override
  void onInit() {
    super.onInit();
    addRoutine();
  }

  void addRoutine() {
    routineList.add(RoutineItemModel());
  }

  void removeRoutine(int index) {
    if (routineList.length > 1 && index >= 0 && index < routineList.length) {
      final item = routineList.removeAt(index);
      item.dispose();
    }
  }

  // Getters for first item (backward compatibility)
  TextEditingController get subjectController =>
      routineList.isNotEmpty ? routineList.first.subjectController : TextEditingController();
  TextEditingController get dateController =>
      routineList.isNotEmpty ? routineList.first.dateController : TextEditingController();
  TextEditingController get timeController =>
      routineList.isNotEmpty ? routineList.first.timeController : TextEditingController();
  TextEditingController get subjectCodeController =>
      routineList.isNotEmpty ? routineList.first.subjectCodeController : TextEditingController();
  TextEditingController get classNameController =>
      routineList.isNotEmpty ? routineList.first.classNameController : TextEditingController();
  Rx<DateTime?> get selectedDate =>
      routineList.isNotEmpty ? routineList.first.selectedDate : Rx<DateTime?>(null);
  Rx<TimeOfDay?> get selectedTime =>
      routineList.isNotEmpty ? routineList.first.selectedTime : Rx<TimeOfDay?>(null);
  Rx<String?> get selectedDay =>
      routineList.isNotEmpty ? routineList.first.selectedDay : Rx<String?>(null);

  Future<void> pickDate(BuildContext context) async {
    if (routineList.isNotEmpty) {
      await routineList.first.pickDate(context);
    }
  }

  Future<void> pickTime(BuildContext context) async {
    if (routineList.isNotEmpty) {
      await routineList.first.pickTime(context);
    }
  }

  void setDay(String? day) {
    if (routineList.isNotEmpty) {
      routineList.first.setDay(day);
    }
  }

  @override
  void onClose() {
    for (final item in routineList) {
      item.dispose();
    }
    super.onClose();
  }
}
