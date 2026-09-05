import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core.dart';
import 'custom_image_view.dart';

class CustomTopDesign extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onSettingTap;
  const CustomTopDesign({super.key, required this.iconPath, this.onSettingTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330.h,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Teal Background Curve
          Positioned(
            top: -270.h,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(120.r),
                bottomRight: Radius.circular(120.r),
              ),
              child: Container(height: 450.h, color: ShipXColors.teal),
            ),
          ),
          Positioned(
            right: 10.w,
            top: 20.h,
            child: IconButton(
              onPressed: onSettingTap ?? () {},
              icon: Icon(
                Icons.settings,
                size: AppDimensions.iconXL.sp,
                color: ShipXColors.background,
              ),
            ),
          ),

          // White Circle with Logo
          Positioned(
            top: 80.h,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 180.r,
                width: 180.r,
                padding: EdgeInsets.all(25.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: ShipXColors.teal, width: 5.r),
                ),
                child: CustomImageView(
                  imagePath: iconPath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
