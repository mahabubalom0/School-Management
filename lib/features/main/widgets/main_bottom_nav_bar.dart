import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../controller/main_controller.dart';

/// The bottom navigation bar used on mobile/tablet screens.
class MainBottomNavBar extends StatelessWidget {
  final MainController controller;

  const MainBottomNavBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeTabIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.textHint,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home_rounded),
            label: AppStrings.tabHome.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore_outlined),
            activeIcon: const Icon(Icons.explore_rounded),
            label: AppStrings.tabExplore.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications_outlined),
            activeIcon: const Icon(Icons.notifications_rounded),
            label: AppStrings.tabAlerts.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bookmark_outline_rounded),
            activeIcon: const Icon(Icons.bookmark_rounded),
            label: AppStrings.tabSaved.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline_rounded),
            activeIcon: const Icon(Icons.person_rounded),
            label: AppStrings.tabProfile.tr,
          ),
        ],
      ),
    );
  }
}
