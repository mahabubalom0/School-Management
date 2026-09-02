import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_top_design.dart';
import '../widgets/top_massage.dart';

class StudentDashbordScreen extends StatelessWidget {
  const StudentDashbordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomTopDesign(iconPath: ImagePath.happyImage),

            AppDimensions.spaceXL.h.verticalSpace,

            Column(
              children: const [
                TopMassageCard(
                  title: 'Welcome Message',
                  subtitle: 'The standard Lorem Ipsum passage',
                  message:
                      '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
