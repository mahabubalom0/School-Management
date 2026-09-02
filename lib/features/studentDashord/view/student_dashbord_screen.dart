import 'package:flutter/material.dart';

import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_top_design.dart';

class StudentDashbordScreen extends StatelessWidget {
  const StudentDashbordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [CustomTopDesign(iconPath: ImagePath.happyImage),
          ],
        ),
      ),
    );
  }
}
