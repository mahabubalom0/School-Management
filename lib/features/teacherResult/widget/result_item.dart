import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class ResultItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final String? classId;
  
  const ResultItem({
    super.key,
    required this.title,
    this.onTap,
    this.classId = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingL.w,
        vertical: AppDimensions.paddingM.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusL.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Blue Bar
            Container(
              height: 12.h,
              width: double.infinity,
              color: const Color(0xFF0F47B2), // Matching the blue in the image
            ),

            // Content
            Padding(
              padding: EdgeInsets.all(AppDimensions.paddingL.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Row(
                    children: [
                      CustomText(
                        text: title,
                        fontSize: AppDimensions.fontXS.sp,
                        fontWeight: FontWeight.bold,
                        color: ShipXColors.deepBlue,
                      ),
                      const Spacer(),
                      CustomText(
                        text: "Class : $classId",
                        fontSize: AppDimensions.fontXS.sp,
                        fontWeight: FontWeight.bold,
                        color: ShipXColors.deepBlue,
                      ),
                    ],
                  ),

                  AppDimensions.spaceL.h.verticalSpace,

                  // Grey Placeholder Area
                  Container(
                    height: 80.h,
                    width: double.infinity,
                    color: ShipXColors.placeholderLight,
                  ),

                  AppDimensions.spaceM.h.verticalSpace,

                  // Publish Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: onTap,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: CustomText(
                        text: "PUBLISH",
                        fontSize: AppDimensions.fontS.sp,
                        fontWeight: FontWeight.w600,
                        color: ShipXColors.deepBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
