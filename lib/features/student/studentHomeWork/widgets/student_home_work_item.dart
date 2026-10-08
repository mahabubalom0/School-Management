import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/core.dart';

class StudentHomeWorkItem extends StatelessWidget {
  final String? name;
  final String? className;
  final String? section;
  final String? homeWork;
  final String? department;
  final String? submissionDate;
  final String? submission;
  const StudentHomeWorkItem({
    super.key,
    this.name,
    this.className,
    this.section,
    this.homeWork,
    this.submissionDate,
    this.submission,
    this.department,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsGeometry.only(bottom: AppDimensions.radiusM.h),
      padding: EdgeInsetsDirectional.symmetric(
        vertical: AppDimensions.paddingXL.h,
        horizontal: AppDimensions.paddingL.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusM.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 0.25,
            offset: const Offset(0, 3),
            spreadRadius: 0.05,
            color: ShipXColors.black.withValues(alpha: 0.2),
          ),
        ],
        color: ShipXColors.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: department ?? "Null",
                  fontSize: AppDimensions.font13.sp,
                  color: ShipXColors.black,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                AppDimensions.paddingS.h.verticalSpace,
                CustomText(text: className ?? "Null"),
              ],
            ),
          ),

          //AppDimensions.spaceS.w.horizontalSpace,
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  text: section ?? "Null",
                  fontSize: AppDimensions.font13.sp,
                  color: ShipXColors.black,
                ),
                AppDimensions.paddingS.h.verticalSpace,
                CustomText(
                  text: submissionDate ?? "Null",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
