import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../controller/main_controller.dart';

/// The left-side navigation rail used on desktop/large screens.
class MainNavigationRail extends StatelessWidget {
  final MainController controller;

  const MainNavigationRail({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Obx(
      () => NavigationRail(
        extended: isDesktop,
        selectedIndex: controller.currentIndex.value,
        onDestinationSelected: controller.changeTabIndex,
        backgroundColor: Theme.of(context).cardColor,
        selectedIconTheme: IconThemeData(color: colors.primary),
        selectedLabelTextStyle: TextStyle(
          color: colors.primary,
          fontWeight: FontWeight.bold,
          fontSize: AppDimensions.fontS.sp,
        ),
        unselectedIconTheme: IconThemeData(color: colors.textHint),
        unselectedLabelTextStyle: TextStyle(
          color: colors.textHint,
          fontSize: AppDimensions.fontS.sp,
        ),
        destinations: [
          NavigationRailDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home_rounded),
            label: Text(AppStrings.tabHome.tr),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.explore_outlined),
            selectedIcon: const Icon(Icons.explore_rounded),
            label: Text(AppStrings.tabExplore.tr),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.notifications_outlined),
            selectedIcon: const Icon(Icons.notifications_rounded),
            label: Text(AppStrings.tabAlerts.tr),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.bookmark_outline_rounded),
            selectedIcon: const Icon(Icons.bookmark_rounded),
            label: Text(AppStrings.tabSaved.tr),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.person_outline_rounded),
            selectedIcon: const Icon(Icons.person_rounded),
            label: Text(AppStrings.tabProfile.tr),
          ),
        ],
      ),
    );
  }
}
