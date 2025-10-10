import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/extensions/sized_box_extension.dart';
import 'package:fintechapp/core/utils/responsive_config.dart';
import 'package:fintechapp/core/widgets/custom_button.dart';
import 'package:fintechapp/features/auth/pages/login_page.dart';
import 'package:fintechapp/features/auth/pages/otp_verification_page.dart';
import 'package:fintechapp/features/auth/pages/widgets/signupwidget/signup_email_field.dart';
import 'package:fintechapp/features/auth/pages/widgets/signupwidget/signup_password_field.dart';
import 'package:fintechapp/features/auth/pages/widgets/signupwidget/signup_terms_row.dart';
import 'package:fintechapp/features/auth/presentation/signup_validation_cubit/signup_validation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => SignUpValidationCubit(),
      child: BlocListener<SignUpValidationCubit, SignUpValidationState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => OtpVerificationPage(email: state.email)),
            );
          } else if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error!)));
          }
        },
        child: Scaffold(
          
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                ResponsiveConfig.paddingLG,
                ResponsiveConfig.paddingXL,
                ResponsiveConfig.paddingLG,
                ResponsiveConfig.paddingLG,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text(AppStrings.signUp, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800, fontSize: 20.sp))),
                  SizedBox(height: ResponsiveConfig.paddingXXL),
                  const SignupEmailField(),
                  SizedBox(height: ResponsiveConfig.paddingLG),
                  const SignupPasswordField(),
                  SizedBox(height: ResponsiveConfig.paddingLG),
                  const SignupTermsRow(),
                  SizedBox(height: ResponsiveConfig.paddingXL),
                  BlocBuilder<SignUpValidationCubit, SignUpValidationState>(
                    buildWhen: (p, c) => p.isLoading != c.isLoading || p.isFormValid != c.isFormValid,
                    builder: (context, state) => CustomButton(
                      text: AppStrings.signUp,
                      isEnabled: state.isFormValid,
                      isLoading: state.isLoading,
                      backgroundColor: theme.primaryColor,
                      onPressed: state.isFormValid ? () => context.read<SignUpValidationCubit>().submit() : null,
                    ),
                  ),
                      200.square,
Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  AppStrings.alreadyHaveAccount,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
           
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                  child: Text(
                    AppStrings.logIn,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                     color: Theme.of(context).primaryColor ,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
              ],
            ),
          ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
