import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../../../core/widgets/custom_dropdown_field.dart';
import '../../../core/widgets/custom_label_textfiled_item.dart';
import '../controller/teacher_routine_controller.dart';
import '../model/routine_item_model.dart';

class TeacherRoutineItem extends StatelessWidget {
  final RoutineItemModel? item;
  final int index;
  final bool showRemove;
  final VoidCallback? onRemove;

  const TeacherRoutineItem({
    super.key,
    this.item,
    this.index = 0,
    this.showRemove = false,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final controller = Get.isRegistered<TeacherRoutineController>()
        ? Get.find<TeacherRoutineController>()
        : Get.put(TeacherRoutineController());

    final routineItem = item ??
        (controller.routineList.isNotEmpty
            ? controller.routineList.first
            : RoutineItemModel());

    return Container(
      padding: EdgeInsetsGeometry.only(
        top: AppDimensions.paddingL.h,
        bottom: AppDimensions.paddingL.h,
        left: AppDimensions.paddingXL.w,
        right: AppDimensions.paddingM.w,
      ),
      decoration: BoxDecoration(
        color: ShipXColors.green.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppDimensions.radiusM.r),
        border: Border.all(
          width: 0.8,
          color: ShipXColors.green,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "${AppStrings.routine.tr} #${index + 1}",
                fontSize: AppDimensions.font13.sp,
                fontWeight: FontWeight.w600,
                color: ShipXColors.blue,
              ),
              if (showRemove)
                IconButton(
                  onPressed: onRemove,
                  icon: Icon(
                    Icons.delete_outline,
                    color: ShipXColors.red,
                    size: AppDimensions.iconL.sp,
                  ),
                  tooltip: 'Remove',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
            ],
          ),
          AppDimensions.spaceM.h.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomLabelTextfiledItem(
                  title: AppStrings.subjectName.tr,
                  hintText: AppStrings.enterSubjectName.tr,
                  controller: routineItem.subjectController,
                ),
              ),
              AppDimensions.spaceL.w.horizontalSpace,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppStrings.examDate.tr,
                      fontSize: AppDimensions.fontM,
                    ),
                    AppDimensions.spaceXS.h.verticalSpace,
                    TextFormField(
                      controller: routineItem.dateController,
                      readOnly: true,
                      onTap: () => routineItem.pickDate(context),
                      style: ShipXTextStyles.body3.copyWith(
                        color: colors.textPrimary,
                        fontSize: getSp(16),
                      ),
                      decoration: InputDecoration(
                        hintText: AppStrings.enterExamDate.tr,
                        suffixIcon: IconButton(
                          onPressed: () => routineItem.pickDate(context),
                          icon: Icon(
                            Icons.calendar_today,
                            size: AppDimensions.iconM.sp,
                          ),
                        ),
                        hintStyle: ShipXTextStyles.body3.copyWith(
                          color: const Color(0xFF94A3B8),
                          fontSize: getSp(16),
                        ),
                        filled: true,
                        fillColor: colors.surface,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: getWidth(ShipXSpacing.md),
                          vertical: getHeight(12),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            getRadius(ShipXRadius.lg),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            getRadius(ShipXRadius.lg),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            getRadius(ShipXRadius.lg),
                          ),
                          borderSide: BorderSide(
                            color: colors.textPrimary,
                            width: 1.5,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            getRadius(ShipXRadius.lg),
                          ),
                          borderSide: BorderSide(color: colors.error, width: 1),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            getRadius(ShipXRadius.lg),
                          ),
                          borderSide: BorderSide(
                            color: colors.error,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          AppDimensions.spaceL.h.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomLabelTextfiledItem(
                  title: AppStrings.subjectCode.tr,
                  hintText: AppStrings.enterSubjectCode.tr,
                  controller: routineItem.subjectCodeController,
                ),
              ),
              AppDimensions.spaceL.w.horizontalSpace,
              Expanded(
                child: CustomLabelTextfiledItem(
                  title: AppStrings.className.tr,
                  hintText: AppStrings.enterClassName.tr,
                  controller: routineItem.classNameController,
                ),
              ),
            ],
          ),
          AppDimensions.spaceL.h.verticalSpace,
          Obx(
            () => CustomDropdownField<String>(
              hintText: AppStrings.day.tr,
              items: controller.days,
              initialValue: routineItem.selectedDay.value,
              getLabel: (value) => value.tr,
              onChanged: (value) {
                routineItem.setDay(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
