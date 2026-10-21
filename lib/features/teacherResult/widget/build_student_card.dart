import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../model/student_show_model.dart';

class BuildStudent extends StatelessWidget {
  const BuildStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final studentResult = const StudentShowModel();
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blue.shade100,
            child: Text(
              studentResult.name?.isNotEmpty == true
                  ? studentResult.name![0].toUpperCase()
                  : "?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
          ),
          title: CustomText(
            text: studentResult.name ?? AppStrings.nameNotFound.tr,
            fontSize: AppDimensions.fontL,
            color: ShipXColors.white,
            fontWeight: FontWeight.bold,
          ),
          subtitle: CustomText(
            text:
                "${AppStrings.roll.tr}: ${studentResult.roll ?? 'N/A'} | ${AppStrings.id.tr}: ${studentResult.id ?? 'N/A'}",
            fontSize: AppDimensions.font13,
            color: ShipXColors.white,
            fontWeight: FontWeight.bold,
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.shade500,
              borderRadius: BorderRadius.circular(12),
            ),
            child: CustomText(
              text:
                  "${AppStrings.gpa.tr}: ${studentResult.mark?.toString() ?? "0"}",
              fontSize: AppDimensions.font13,
              color: ShipXColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  const Divider(),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    Icons.book_outlined,
                    AppStrings.subject.tr,
                    studentResult.subject ?? "N/A",
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    Icons.group_outlined,
                    AppStrings.section.tr,
                    studentResult.section ?? "N/A",
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    Icons.class_outlined,
                    AppStrings.className.tr,
                    studentResult.className ?? "N/A",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.blue.shade700),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: ShipXColors.background,
          ),
        ),
      ],
    );
  }
}
