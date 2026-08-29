import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class ManagementItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const ManagementItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(AppDimensions.paddingXL.r),
            decoration: BoxDecoration(
              color: ShipXColors.blue,
              borderRadius: BorderRadius.circular(AppDimensions.radiusL.r),
            ),
            child: Center(
              child: Image.asset(
                iconPath,
                width: AppDimensions.imageSize60.w,
                height: AppDimensions.imageSize60.h,
                color: ShipXColors.white,
              ),
            ),
          ),
          AppDimensions.spaceS.h.verticalSpace,
          CustomText(
            text: title,
            fontSize: AppDimensions.fontM.sp,
            fontWeight: FontWeight.w500,
            color: context.appColors.textPrimary,
          ),
        ],
      ),
    );
  }
}
