import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/core.dart';
import '../model/home_model.dart';

/// A single post card used inside the home list.
class HomePostCard extends StatelessWidget {
  final HomeModel item;

  const HomePostCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final avatarSize = getValue<double>(mobile: AppDimensions.iconXXL, tablet: 52, desktop: 60);
    final titleSize = getValue<double>(
      mobile: AppDimensions.fontL,
      tablet: AppDimensions.fontXL,
      desktop: AppDimensions.fontXXL,
    );
    final bodySize = getValue<double>(
      mobile: AppDimensions.fontS,
      tablet: AppDimensions.fontM,
      desktop: AppDimensions.fontL,
    );

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL.r),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(AppDimensions.radiusL.r),
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.paddingL.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CardHeader(
                  item: item,
                  colors: colors,
                  avatarSize: avatarSize,
                  titleSize: titleSize,
                ),
                SizedBox(height: AppDimensions.spaceM.h),
                CustomText(
                  text: item.body ?? 'No Description',
                  color: colors.textSecondary,
                  fontSize: bodySize,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  final HomeModel item;
  final AppColorScheme colors;
  final double avatarSize;
  final double titleSize;

  const _CardHeader({
    required this.item,
    required this.colors,
    required this.avatarSize,
    required this.titleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: avatarSize.r,
          height: avatarSize.r,
          decoration: BoxDecoration(
            gradient: colors.primaryGradient,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM.r),
          ),
          child: Center(
            child: CustomText(
              text: '${item.id ?? 0}',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: AppDimensions.fontS,
            ),
          ),
        ),
        SizedBox(width: AppDimensions.spaceM.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: item.title ?? 'No Title',
                fontWeight: FontWeight.bold,
                fontSize: titleSize,
                maxLines: 2,
                color: colors.textPrimary,
              ),
              if (item.userId != null)
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: CustomText(
                    text: 'User ID: ${item.userId}',
                    fontSize: AppDimensions.fontXS,
                    color: colors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
        Icon(Icons.chevron_right, color: colors.textHint, size: 20.r),
      ],
    );
  }
}

/// Skeleton placeholder card shown while loading.
class HomePostCardSkeleton extends StatelessWidget {
  const HomePostCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePostCard(
      item: HomeModel(
        id: 1,
        title: 'This is a skeleton title placeholder that spans two lines',
        body: 'This is a much longer body text for the skeleton placeholder to ensure the layout looks realistic while loading.',
      ),
    );
  }
}
