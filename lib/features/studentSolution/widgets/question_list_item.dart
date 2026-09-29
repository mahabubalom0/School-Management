import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class QuestionListItem extends StatelessWidget {
  final String name;
  final String question;
  final VoidCallback? onTap;
  const QuestionListItem({
    super.key,
    required this.name,
    required this.question,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingM.w,
          vertical: AppDimensions.paddingL.h,
        ),

        decoration: BoxDecoration(
          color: ShipXColors.blue,
          border: Border.all(
            color: ShipXColors.green,
            width: 2,
            strokeAlign: 5.0,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.radiusM.r),
        ),
        child: Row(
          children: [
            Container(
              width: 50.r,
              height: 50.r,
              decoration: BoxDecoration(
                color: ShipXColors.success.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusCircular.r,
                ),
              ),
              child: Center(
                child: CustomText(
                  text: name[0].toUpperCase(),
                  fontSize: AppDimensions.fontM,
                  color: ShipXColors.blue,
                ),
              ),
            ),
            AppDimensions.spaceS.w.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Name : $name",
                  fontSize: AppDimensions.fontM,
                  color: ShipXColors.white,
                ),
                CustomText(
                  text: question,
                  fontSize: AppDimensions.fontXS,
                  color: ShipXColors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
