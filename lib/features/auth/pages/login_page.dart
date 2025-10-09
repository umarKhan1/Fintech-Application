import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/extensions/navigation_extensions.dart';
import 'package:fintechapp/core/extensions/sized_box_extension.dart';
import 'package:fintechapp/core/widgets/custom_button.dart';
import 'package:fintechapp/core/widgets/custom_text_field.dart';
import 'package:fintechapp/features/dashboard/pages/dashboard_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.login),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppSpacing.heightXL,
            
            // Welcome text
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headlineLarge?.color,
                fontFamily: 'Inter',
              ),
              textAlign: TextAlign.center,
            ),
            
            AppSpacing.heightSM,
            
            Text(
              'Please sign in to your account',
              style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontFamily: 'Inter',
              ),
              textAlign: TextAlign.center,
            ),
            
            AppSpacing.heightXXL,
            
            // Email field
            const CustomTextField(
              label: AppStrings.email,
              keyboardType: TextInputType.emailAddress,
            ),
            
            AppSpacing.heightLG,
            
            // Password field
            const CustomTextField(
              label: AppStrings.password,
              obscureText: true,
            ),
            
            AppSpacing.heightSM,
            
            // Forgot password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Demo navigation with fade transition
                  context.pushFade(const LoginPage());
                },
                child: const Text(AppStrings.forgotPassword),
              ),
            ),
            
            AppSpacing.heightXL,
            
            // Login button
            CustomButton(
              text: AppStrings.login,
              onPressed: () {
                // Demo navigation: Push and clear stack to go to dashboard
                context.pushAndClearStack(const DashboardPage());
              },
            ),
            
            AppSpacing.heightLG,
            
            // Sign up button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.dontHaveAccount,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontFamily: 'Inter',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Demo navigation with scale transition
                    context.pushScale(const LoginPage());
                  },
                  child: const Text(AppStrings.signUp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
