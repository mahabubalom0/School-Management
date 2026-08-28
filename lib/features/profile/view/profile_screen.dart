import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../core/storage/storage_service.dart';
import '../../../routes/app_routes.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_settings_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final maxWidth = getValue<double>(mobile: double.infinity, tablet: 640, desktop: 720);

    return SingleChildScrollView(
      padding: EdgeInsets.all(AppDimensions.paddingL.r),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileHeaderWidget(),
              SizedBox(height: AppDimensions.spaceXXL.h),
              const ProfileSettingsSectionWidget(),
              SizedBox(height: AppDimensions.spaceXXL.h),
              CustomButton(
                text: AppStrings.logout.tr,
                icon: Icons.logout_rounded,
                color: colors.error.withValues(alpha: 0.1),
                textColor: colors.error,
                onPressed: () async {
                  await Get.find<StorageService>().clearAuth();
                  Get.offAllNamed(AppRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
