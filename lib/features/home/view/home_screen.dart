import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../core/widgets/empty_view.dart';
import '../controller/home_controller.dart';
import '../widgets/home_post_card.dart';
import '../widgets/home_error_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: context.appColors.background,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxCWidth),
          child: Obx(() {
            if (controller.errorMsg.isNotEmpty && controller.posts.isEmpty) {
              return HomeErrorWidget(
                message: controller.errorMsg.value,
                onRetry: controller.refreshData,
              );
            }

            if (controller.posts.isEmpty && !controller.isLoading.value) {
              return const EmptyView(message: 'No posts available.');
            }

            return Skeletonizer(
              enabled: controller.isLoading.value,
              child: RefreshIndicator(
                onRefresh: controller.refreshData,
                child: ListView.separated(
                  controller: controller.scrollController,
                  padding: EdgeInsets.all(AppDimensions.paddingL.r),
                  itemCount: controller.isLoading.value
                      ? 6
                      : (controller.posts.length + (controller.isMoreLoading.value ? 1 : 0)),
                  separatorBuilder: (_, _) => SizedBox(height: AppDimensions.spaceM.h),
                  itemBuilder: (context, index) {
                    if (controller.isLoading.value) {
                      return const HomePostCardSkeleton();
                    }
                    if (index >= controller.posts.length) {
                      return const HomePostCardSkeleton();
                    }
                    return HomePostCard(item: controller.posts[index]);
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
