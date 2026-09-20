import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_image_view.dart';

class StudentAddQuestion extends StatelessWidget {
  const StudentAddQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShipXColors.blue,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new, size: AppDimensions.iconM.sp),
        ),
        title: Row(
          children: [
            const CustomImageView(
              imagePath: ImagePath.resultImage,
              height: AppDimensions.imageSize38,
              color: ShipXColors.background,
            ),
            AppDimensions.spaceS.w.horizontalSpace,
            const CustomText(
              text: "ASK QUESTION",
              color: ShipXColors.white,
              fontSize: AppDimensions.fontL,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.paddingXXL.h,
          horizontal: AppDimensions.paddingXL.w,
        ),
        child: Column(
          children: [
            const CustomText(
              text: "Write Your Question",
              fontSize: AppDimensions.fontL,
            ),
            AppDimensions.spaceXS.h.verticalSpace,
            CustomTextField(
              controller: TextEditingController(),
              hintText: "Write your question",
              maxLine: 8,
              minLine: 8,
            ),
          ],
        ),
      ),
    );
  }
}
