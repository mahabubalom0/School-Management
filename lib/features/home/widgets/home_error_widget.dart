import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';

/// The error state widget shown when data loading fails.
class HomeErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const HomeErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingXXL.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: AppDimensions.spaceMassive.r,
              color: colors.error,
            ),
            SizedBox(height: AppDimensions.spaceL.h),
            CustomText(
              text: message,
              color: colors.error,
              textAlign: TextAlign.center,
              fontSize: AppDimensions.fontL,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: AppDimensions.spaceXL.h),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingXXL.w,
                  vertical: AppDimensions.paddingM.h,
                ),
              ),
              child: Text('retry'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
