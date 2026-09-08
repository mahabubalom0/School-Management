import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class TopMassageCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String message;

  const TopMassageCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppDimensions.paddingXL.r),
      decoration: BoxDecoration(
        color: const Color(0xFF1546C9), // Deep blue color matching the image
        borderRadius: BorderRadius.circular(AppDimensions.radiusL.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomText(
                text: title,
                fontWeight: FontWeight.w500,
                fontSize: AppDimensions.fontXL.sp,
                color: ShipXColors.background,
              ),
              AppDimensions.spaceL.w.horizontalSpace,
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: AppDimensions.iconXL.r,
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomText(
            text: subtitle,
            color: ShipXColors.background,
            fontSize: AppDimensions.fontM,
          ),
          const SizedBox(height: 6),
          CustomText(
            text: message,
            color: ShipXColors.background,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
