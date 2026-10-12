import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../model/home_work_model.dart';

class StudentHomeWorkDeatils extends StatelessWidget {
  const StudentHomeWorkDeatils({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;
    final hwData = arguments?['hwData'] as HomeWorkModel?;
    // ignore: unused_local_variable
    final index = arguments?['index'];

    if (hwData == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Student Home Work Details")),
        body: const Center(child: Text("No homework details found")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShipXColors.blue,
        title: const Text("Student Home Work Details"),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: AppDimensions.paddingL.w,
          right: AppDimensions.paddingL.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDimensions.spaceL.h.verticalSpace,
            Container(
              width: double.infinity,
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: AppDimensions.paddingL.w,
                vertical: AppDimensions.paddingL.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radiusL),
                color: ShipXColors.teal.withValues(alpha: 0.5),
                border: BoxBorder.all(color: ShipXColors.deepBlue, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Subject : ${hwData.subject ?? "No Data"}",
                    fontSize: AppDimensions.font13,
                    color: ShipXColors.black,
                  ),
                  AppDimensions.spaceS.h.verticalSpace,
                  CustomText(
                    text: "Class : ${hwData.className ?? "No Class"}",
                    fontSize: AppDimensions.font13,
                    color: ShipXColors.black,
                  ),
                  AppDimensions.spaceS.h.verticalSpace,
                  CustomText(
                    text: "Section : ${hwData.section}",
                    fontSize: AppDimensions.font13,
                    color: ShipXColors.black,
                  ),
                  AppDimensions.spaceS.h.verticalSpace,
                  CustomText(
                    text: "DateLine : ${hwData.dateLine ?? "No Data"}",
                    fontSize: AppDimensions.font13,
                    color: ShipXColors.black,
                  ),
                  AppDimensions.spaceS.h.verticalSpace,
                  CustomText(
                    text: "Create At : ${hwData.createAt ?? "No Data"}",
                    fontSize: AppDimensions.font13,
                    color: ShipXColors.black,
                  ),
                ],
              ),
            ),
            AppDimensions.spaceXL.h.verticalSpace,
            CustomText(
              text: "Home Work : $index :- ",
              fontSize: AppDimensions.fontS,
              color: ShipXColors.black,
            ),
            AppDimensions.spaceL.verticalSpace,
            CustomText(
              text: hwData.addHomework ?? "No Home Work today",
              fontSize: AppDimensions.fontL,
              color: ShipXColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
