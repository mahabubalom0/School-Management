import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../utils/app_size_class.dart';
import '../theme/app_dimensions.dart';

class SkeletonItem extends StatelessWidget {
  const SkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getRadius(AppDimensions.radiusL)),
        ),
        child: Padding(
          padding: EdgeInsets.all(getRadius(AppDimensions.paddingL)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 24,
                  ),
                  SizedBox(width: getWidth(AppDimensions.spaceM)),
                  Expanded(
                    child: Container(
                      height: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: getHeight(AppDimensions.spaceM)),
              Container(
                height: 12,
                width: double.infinity,
                color: Colors.white,
              ),
              SizedBox(height: getHeight(AppDimensions.spaceS)),
              Container(
                height: 12,
                width: 200,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkeletonListView extends StatelessWidget {
  final int itemCount;

  const SkeletonListView({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
        vertical: getHeight(AppDimensions.paddingL),
      ),
      itemCount: itemCount,
      separatorBuilder: (context, index) => SizedBox(height: getHeight(AppDimensions.spaceM)),
      itemBuilder: (context, index) => const SkeletonItem(),
    );
  }
}
