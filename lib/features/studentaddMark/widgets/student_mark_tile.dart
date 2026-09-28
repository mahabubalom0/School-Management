import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class StudentMarkTile extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController rollNumber;
  final TextEditingController initialMark;
  final Function(String) onMarkChanged;
  final VoidCallback? deleteOnTap;
  const StudentMarkTile({
    super.key,
    required this.name,
    required this.rollNumber,
    required this.initialMark,
    required this.onMarkChanged,
    this.deleteOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: name,
                  hintText: "Enter Student Name",
                ),
                const SizedBox(height: AppDimensions.spaceL),
                CustomTextField(
                  controller: rollNumber,
                  hintText: "Enter Roll Number",
                ),
              ],
            ),
          ),
          AppDimensions.spaceXL.w.horizontalSpace,
          Column(
            children: [
              IconButton(
                onPressed: deleteOnTap,
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
              AppDimensions.spaceM.h.verticalSpace,
              SizedBox(
                width: 80,
                child: TextFormField(
                  controller: initialMark,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Mark',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: onMarkChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
