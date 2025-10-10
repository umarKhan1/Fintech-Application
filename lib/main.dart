import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/providers/app_providers.dart';
import 'package:fintechapp/core/theme/app_theme.dart';
import 'package:fintechapp/features/auth/pages/login_page.dart';
import 'package:fintechapp/features/auth/pages/signup_page.dart';
import 'package:fintechapp/features/onboarding/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fintechapp/features/kyc/pages/kyc_country_and_document_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), 
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: AppProviders.providers,
          child: MaterialApp(
            title: AppStrings.appName,
            theme: AppTheme.lightTheme,
            
            debugShowCheckedModeBanner: false,
            // Set SignUpPage as home for preview; switch back to Onboarding when ready
            home: const OnboardingPage(),
            routes: {
              '/onboarding': (_) => const OnboardingPage(),
              '/login': (_) => const LoginPage(),
              '/signup': (_) => const SignUpPage(),
              '/kyc': (_) => const KycCountryAndDocumentPage(),
            },
          ),
        );
      },
    );
  }
}
