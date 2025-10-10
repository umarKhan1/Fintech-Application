import 'package:fintechapp/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo
        Image.asset(
          Theme.of(context).brightness == Brightness.dark
              ? AppImages.darkLogo
              : AppImages.lightLogo,
          height: 240.h,

          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
