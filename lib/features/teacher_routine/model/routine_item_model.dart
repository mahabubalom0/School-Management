import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RoutineItemModel {
  final TextEditingController subjectController;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final TextEditingController subjectCodeController;
  final TextEditingController classNameController;

  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);
  final Rx<String?> selectedDay = Rx<String?>(null);

  RoutineItemModel({
    TextEditingController? subjectController,
    TextEditingController? dateController,
    TextEditingController? timeController,
    TextEditingController? subjectCodeController,
    TextEditingController? classNameController,
    DateTime? initialDate,
    TimeOfDay? initialTime,
    String? initialDay,
  }) : subjectController = subjectController ?? TextEditingController(),
       dateController = dateController ?? TextEditingController(),
       timeController = timeController ?? TextEditingController(),
       subjectCodeController = subjectCodeController ?? TextEditingController(),
       classNameController = classNameController ?? TextEditingController() {
    if (initialDate != null) {
      selectedDate.value = initialDate;
      dateController?.text = DateFormat('dd MMM yyyy').format(initialDate);
    }
    if (initialTime != null) {
      selectedTime.value = initialTime;
    }
    if (initialDay != null) {
      selectedDay.value = initialDay;
    }
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = picked;
      dateController.text = DateFormat('dd MMM yyyy').format(picked);
    }
  }

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

  void setDay(String? day) {
    selectedDay.value = day;
  }

  void dispose() {
    subjectController.dispose();
    dateController.dispose();
    timeController.dispose();
    subjectCodeController.dispose();
    classNameController.dispose();
  }
}
