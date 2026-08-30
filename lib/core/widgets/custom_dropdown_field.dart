import 'package:flutter/material.dart';

import '../core.dart';
import '../utils/app_icons.dart';
import 'custom_svg_icon.dart';


class CustomDropdownField<T> extends StatelessWidget {
  final T? initialValue;
  final String hintText;
  final List<T> items;
  final String Function(T) getLabel;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;
  final bool fieldColor;

  const CustomDropdownField({
    super.key,
    this.initialValue,
    required this.hintText,
    required this.items,
    required this.getLabel,
    required this.onChanged,
    this.validator,
    this.fieldColor=true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return DropdownButtonFormField<T>(
      isExpanded: true,
      initialValue: initialValue,
      validator: validator,
      style: TextStyle(color: colors.textPrimary),
      hint: CustomText(
        text: hintText,
        color: colors.textHint,
        fontSize: AppDimensions.fontS,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor:fieldColor? colors.background:Colors.transparent,
        contentPadding: EdgeInsets.symmetric(
          horizontal: getWidth(AppDimensions.paddingM),
          vertical: getHeight(AppDimensions.paddingM),
        ),
        suffixIcon: CustomSvgIcon(
          assetName: IconPath.arrowDown,
          color: colors.textPrimary,
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      ),
      dropdownColor: colors.background,
      menuMaxHeight: 350,
      borderRadius: BorderRadius.circular(AppDimensions.radiusM),
      elevation: 4,
      selectedItemBuilder: (context) => items.map((val) {
        return Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: getLabel(val),
            color: colors.textPrimary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            fontSize: AppDimensions.fontS,
          ),
        );
      }).toList(),
      items: items.asMap().entries.map((entry) {
        final val = entry.value;
        return DropdownMenuItem<T>(
          value: val,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getHeight(AppDimensions.paddingM),
                ),
                child: CustomText(
                  text: getLabel(val),
                  color: colors.textPrimary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontSize: AppDimensions.fontM,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
