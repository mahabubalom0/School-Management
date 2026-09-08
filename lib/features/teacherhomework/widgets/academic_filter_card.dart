import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/core.dart';

class AcademicFilterCard extends StatefulWidget {
  final List<String> classList;
  final List<String> sectionsList;
  final List<String> subjectsList;
  const AcademicFilterCard({
    super.key,
    required this.classList,
    required this.sectionsList,
    required this.subjectsList,
  });

  @override
  State<AcademicFilterCard> createState() => _AcademicFilterCardState();
}

class _AcademicFilterCardState extends State<AcademicFilterCard> {
  String? selectedClass;
  String? selectedSection;
  String? selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ShipXColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top Blue Bar
          Container(
            height: 12.h,
            decoration: BoxDecoration(
              color: ShipXColors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingL.w,
              vertical: AppDimensions.paddingL.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFilterItem(
                  title: "Class",
                  items: widget.classList,
                  selectedValue: selectedClass,
                  onChanged: (val) => setState(() => selectedClass = val),
                ),
                AppDimensions.spaceL.h.verticalSpace,
                _buildFilterItem(
                  title: "Section",
                  items: widget.sectionsList,
                  selectedValue: selectedSection,
                  onChanged: (val) => setState(() => selectedSection = val),
                ),
                AppDimensions.spaceL.h.verticalSpace,
                _buildFilterItem(
                  title: "Subject",
                  items: widget.subjectsList,
                  selectedValue: selectedSubject,
                  onChanged: (val) => setState(() => selectedSubject = val),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterItem({
    required String title,
    required List<String> items,
    required String? selectedValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: AppDimensions.fontS.sp,
          color: ShipXColors.black,
        ),
        AppDimensions.spaceS.h.verticalSpace,
        Container(
          height: 35.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFE5E5E5),
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingS.w),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: ShipXColors.deepBlue,
              value: selectedValue,
              isExpanded: true,
              isDense: true,
              hint: CustomText(
                text: "Select",
                fontSize: AppDimensions.fontS.sp,
                color: ShipXColors.bodyLight,
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: ShipXColors.teal,
                size: 24.sp,
              ),
              onChanged: onChanged,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: CustomText(
                    text: value,
                    fontSize: AppDimensions.fontS.sp,
                    color: ShipXColors.black,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
