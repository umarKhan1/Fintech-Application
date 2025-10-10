import 'package:fintechapp/core/extensions/navigation_extensions.dart';
import 'package:fintechapp/core/utils/responsive_config.dart';
import 'package:fintechapp/features/auth/pages/widgets/loginwidget/login_form_widget.dart';
import 'package:fintechapp/features/auth/pages/widgets/loginwidget/login_header_widget.dart';
import 'package:fintechapp/features/onboarding/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(ResponsiveConfig.paddingLG),
          child: Column(
            children: [
              const LoginHeaderWidget(),
              LoginFormWidget(
                onLoginSuccess: () {
                  context.pushReplacement(const OnboardingPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}