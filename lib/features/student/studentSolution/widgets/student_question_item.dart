import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/core.dart';

class StudentQuestionItem extends StatelessWidget {
  final String questionTitle;
  const StudentQuestionItem({super.key, required this.questionTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppDimensions.paddingM.h),
      decoration: BoxDecoration(
        color: ShipXColors.background,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top Blue Bar
          Container(
            height: 12.h,
            decoration: BoxDecoration(
              color: ShipXColors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.radiusL.r),
                topRight: Radius.circular(AppDimensions.radiusL.r),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppDimensions.paddingL.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: "Question",
                  fontSize: AppDimensions.fontL,
                  fontWeight: FontWeight.bold,
                  color: ShipXColors.blue,
                ),
                CustomText(
                  text: questionTitle,
                  fontSize: AppDimensions.fontS,
                  color: ShipXColors.body,
                ),
                AppDimensions.spaceS.h.verticalSpace,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingM.w,
                        vertical: AppDimensions.paddingXS.h,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const CustomText(
                      text: 'VIEW',
                      fontSize: AppDimensions.fontL,
                      fontWeight: FontWeight.w500,
                      color: ShipXColors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
