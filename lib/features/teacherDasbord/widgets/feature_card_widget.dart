import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../core/widgets/custom_image_view.dart';

class FeatureCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onTap;
  const FeatureCardWidget({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsetsDirectional.symmetric(
              vertical: AppDimensions.paddingXL.h,
              horizontal: AppDimensions.paddingXL.w,
            ),
            decoration: BoxDecoration(
              color: ShipXColors.primary.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(AppDimensions.radiusL.r),
            ),
            child: Center(
              child: CustomImageView(
                imagePath: imagePath,
                height: AppDimensions.imageSize60.h,
                width: AppDimensions.imageSize60.w,
              ),
            ),
          ),
        ),
        AppDimensions.spaceS.h.verticalSpace,
        CustomText(
          text: title,
          fontSize: AppDimensions.fontM,
          color: ShipXColors.black,
        ),
      ],
    );
  }
}
