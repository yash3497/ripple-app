import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ripple_healthcare/app/modules/medication/controllers/medication_controller.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/app/widget/custom_tetxt_field.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class AddMedicationView extends GetView<MedicationController> {
  const AddMedicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MedicationController>(builder: (ct) {
      return WillPopScope(
        onWillPop: () async {
          controller.addMedicationPageStatus = 0;
          controller.selectedDate = null;
          controller.selectedTime = null;
          controller.seletedMedType = null;
          controller.medicationNameController.clear();
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                    controller.addMedicationPageStatus = 0;
                    controller.selectedDate = null;
                    controller.selectedTime = null;
                    controller.seletedMedType = null;
                    controller.medicationNameController.clear();
                  },
                  child: Text("Cancel"))
            ],
          ),
          // bottomNavigationBar:
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: controller.addMedicationPageStatus == 0
                      ? "Medication Name"
                      : controller.addMedicationPageStatus == 1
                          ? "Choose the Medication Type"
                          : controller.addMedicationPageStatus == 2
                              ? "Choose the Date"
                              : "Scheduled time for medication",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                addVerticalSpace(12),
                controller.addMedicationPageStatus == 0
                    ? CustomTextField(
                        controller: controller.medicationNameController,
                        hintText: "Medication name",
                        onChanged: (p0) {
                          controller.update();
                        },
                      )
                    : controller.addMedicationPageStatus == 1
                        ? ChooseMedicationTypeWidget(controller: controller)
                        : controller.addMedicationPageStatus == 2
                            ? CustomTextField(
                                readOnly: true,
                                controller: TextEditingController(
                                  text: controller.selectedDate != null
                                      ? "${controller.selectedDate?.toLocal()}"
                                          .split(' ')[0]
                                      : "",
                                ),
                                hintText: "Select Date",
                                onTap: () async {
                                  DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: controller.selectedDate ??
                                        DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );

                                  if (picked != null &&
                                      picked != controller.selectedDate) {
                                    controller.selectedDate = picked;
                                    controller.update();
                                  }
                                },
                              )
                            : CustomTextField(
                                controller: TextEditingController(
                                  text: controller.selectedTime != null
                                      ? _formatTime(controller.selectedTime!)
                                      : "",
                                ),
                                readOnly: true,
                                hintText: "Select Time",
                                onTap: () async {
                                  TimeOfDay? picked = await showTimePicker(
                                    context: context,
                                    initialTime: controller.selectedTime ??
                                        TimeOfDay.now(),
                                  );

                                  if (picked != null &&
                                      picked != controller.selectedTime) {
                                    controller.selectedTime = picked;
                                    controller.update();
                                  }
                                },
                              ),
                Spacer(),
                AbsorbPointer(
                  absorbing:
                      (controller.medicationNameController.text.isEmpty &&
                              controller.seletedMedType == null &&
                              controller.selectedDate == null &&
                              controller.selectedTime == null)
                          ? true
                          : false,
                  child: AppButton(
                    onPressed: () {
                      if (controller.medicationNameController.text.isNotEmpty) {
                        controller.addMedicationPageStatus = 1;
                        controller.medicationNameController.clear();
                      } else if (controller.seletedMedType != null) {
                        controller.seletedMedType = null;
                        controller.addMedicationPageStatus = 2;
                      } else if (controller.selectedDate != null) {
                        controller.selectedDate = null;
                        controller.addMedicationPageStatus = 3;
                      }
                      if (controller.addMedicationPageStatus == 3) {
                        Get.back();
                        controller.addMedicationPageStatus = 0;
                        controller.selectedDate = null;
                        controller.selectedTime = null;
                        controller.seletedMedType = null;
                        controller.medicationNameController.clear();
                      }
                      controller.update();
                    },
                    buttonText: controller.addMedicationPageStatus == 3
                        ? "Add"
                        : "Next",
                    bgColor:
                        (controller.medicationNameController.text.isEmpty &&
                                controller.seletedMedType == null &&
                                controller.selectedDate == null &&
                                controller.selectedTime == null)
                            ? AppColor.disableGreenColor
                            : AppColor.greenColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  String _formatTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final formattedTime = DateFormat.jm().format(dateTime);
    return formattedTime;
  }
}

class ChooseMedicationTypeWidget extends StatelessWidget {
  const ChooseMedicationTypeWidget({
    super.key,
    required this.controller,
  });

  final MedicationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Border color
        borderRadius: BorderRadius.circular(8.0), // Border radius
      ),
      child: DropdownButton<String>(
        underline: SizedBox.shrink(),
        isExpanded: true,
        hint: Text('Select From Here'),
        value: controller.seletedMedType,
        items: controller.medicationTypes
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          controller.seletedMedType = value;
          controller.update();
        },
      ),
    );
  }
}
