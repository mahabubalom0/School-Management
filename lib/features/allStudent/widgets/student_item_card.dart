import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class StudentItemCard extends StatelessWidget {
  final String name;
  final String studentId;
  final String className;
  final VoidCallback? onTap;
  const StudentItemCard({
    super.key,
    required this.name,
    required this.studentId,
    required this.className,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.paddingM.h,
          horizontal: AppDimensions.paddingL.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.radiusXL.r),
          color: ShipXColors.blue,
          border: BoxBorder.all(
            width: 2.w,
            color: ShipXColors.green,
            strokeAlign: 5.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Name- $name",
                    fontSize: AppDimensions.fontM,
                    color: ShipXColors.backgroundLight,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppDimensions.spaceS.h.verticalSpace,
                  CustomText(
                    text: "Student Id- $studentId",
                    fontSize: AppDimensions.fontM,
                    color: ShipXColors.backgroundLight,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            CustomText(
              text: "Class- $className",
              fontSize: AppDimensions.fontM,
              color: ShipXColors.backgroundLight,
            ),
          ],
        ),
      ),
    );
  }
}
