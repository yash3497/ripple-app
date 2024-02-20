import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicationController extends GetxController {
  final TextEditingController medicationNameController =
      TextEditingController();
  String? seletedMedType;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  int addMedicationPageStatus = 0;

  List<String> medicationTypes = ["Tablet", "Capsule", "Syrup"];

  List calendarList = [
    {
      "digit": "1",
      "date": "Mon",
    },
    {
      "digit": "2",
      "date": "Tue",
    },
    {
      "digit": "3",
      "date": "Wed",
    },
    {
      "digit": "4",
      "date": "Thu",
    },
    {
      "digit": "5",
      "date": "Fri",
    },
    {
      "digit": "6",
      "date": "Sat",
    },
    {
      "digit": "7",
      "date": "Sunday",
    },
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
