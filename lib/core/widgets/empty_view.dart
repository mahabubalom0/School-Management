import 'package:flutter/material.dart';
import '../utils/app_size_class.dart';
import '../theme/app_colors.dart';
import 'custom_text.dart';

class EmptyView extends StatelessWidget {
  final String message;
  final IconData? icon;

  const EmptyView({
    super.key,
    required this.message,
    this.icon = Icons.inbox_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: getRadius(80),
            color: context.appColors.textHint,
          ),
          SizedBox(height: getHeight(16)),
          CustomText(
            text: message,
            fontSize: 16,
            color: context.appColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
