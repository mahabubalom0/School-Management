import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/core.dart';

class TeacherRoutineController extends GetxController {
  final subjectController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final subjectCodeController = TextEditingController();
  final classNameController = TextEditingController();

  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);

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

  final Rx<String?> selectedDay = Rx<String?>(null);

  void setDay(String? day) {
    selectedDay.value = day;
  }

  /// Pick Date (Date, Month, Year) using Flutter's showDatePicker
  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = picked;
      // Formats as "23 Oct 2026" (Day Month Year)
      dateController.text = DateFormat('dd MMM yyyy').format(picked);
    }
  }

  /// Pick Time using Flutter's showTimePicker
  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value ?? TimeOfDay.now(),
    );

    if (picked != null) {
      selectedTime.value = picked;
      timeController.text = picked.format(context);
    }
  }

  @override
  void onClose() {
    subjectController.dispose();
    dateController.dispose();
    timeController.dispose();
    subjectCodeController.dispose();
    classNameController.dispose();
    super.onClose();
  }
}
