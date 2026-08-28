import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../controller/main_controller.dart';
import '../widgets/main_bottom_nav_bar.dart';
import '../widgets/main_navigation_rail.dart';
import '../widgets/main_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();
    final colors = context.appColors;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: MainAppBar(controller: controller),
      // ── Desktop/Tablet: side NavigationRail ──────────────────────────────
      body: isTablet || isDesktop
          ? Row(
              children: [
                MainNavigationRail(controller: controller),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: Obx(
                    () => IndexedStack(
                      index: controller.currentIndex.value,
                      children: controller.screens,
                    ),
                  ),
                ),
              ],
            )
          // ── Mobile: regular body ─────────────────────────────────────────
          : Obx(
              () => IndexedStack(
                index: controller.currentIndex.value,
                children: controller.screens,
              ),
            ),
      // Only show bottom nav on mobile
      bottomNavigationBar: (isTablet || isDesktop)
          ? null
          : MainBottomNavBar(controller: controller),
    );
  }
}
