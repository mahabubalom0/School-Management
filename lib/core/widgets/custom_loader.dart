import 'package:flutter/material.dart';
import '../utils/app_size_class.dart';
import '../theme/app_colors.dart';

class CustomLoader extends StatelessWidget {
  final double? size;
  final Color? color;

  const CustomLoader({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    final finalSize = getRadius(size ?? 40);

    return Center(
      child: SizedBox(
        height: finalSize,
        width: finalSize,
        child: CircularProgressIndicator(
          color: color ?? context.appColors.primary,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
