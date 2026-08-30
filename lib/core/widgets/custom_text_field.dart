import 'package:flutter/material.dart';
import '../utils/app_size_class.dart';
import '../theme/app_colors.dart';
import '../theme/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onTogglePassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.obscureText = false,
    this.onTogglePassword,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,

      validator: validator,
      style: ShipXTextStyles.body3.copyWith(
        color: colors.textPrimary,
        fontSize: getSp(16),
      ),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,

        hintStyle: ShipXTextStyles.body3.copyWith(
          color: const Color(0xFF94A3B8),
          fontSize: getSp(16),
        ),
        filled: true,
        fillColor: colors.surface,
        constraints: BoxConstraints(
          maxHeight: getHeight(50),
          minHeight: getHeight(50),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: getWidth(ShipXSpacing.md),
          vertical: getHeight(12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getRadius(ShipXRadius.lg)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getRadius(ShipXRadius.lg)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getRadius(ShipXRadius.lg)),
          borderSide: BorderSide(color: colors.textPrimary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getRadius(ShipXRadius.lg)),
          borderSide: BorderSide(color: colors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getRadius(ShipXRadius.lg)),
          borderSide: BorderSide(color: colors.error, width: 1.5),
        ),
        suffixIcon: isPassword
            ? Padding(
                padding: EdgeInsets.only(right: getWidth(ShipXSpacing.sm)),
                child: IconButton(
                  icon: Icon(
                    obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: colors.textSecondary.withValues(alpha: 0.6),
                    size: getSp(20),
                  ),
                  onPressed: onTogglePassword,
                ),
              )
            : null,
      ),
    );
  }
}
