import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/extensions/sized_box_extension.dart';
import 'package:fintechapp/core/utils/responsive_config.dart';
import 'package:fintechapp/core/widgets/custom_button.dart';
import 'package:fintechapp/core/widgets/custom_text_field.dart';
import 'package:fintechapp/features/auth/pages/signup_page.dart';
import 'package:fintechapp/features/auth/presentation/login_validation_cubit/login_validation_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormWidget extends StatelessWidget {

  const LoginFormWidget({
    required this.onLoginSuccess, super.key,
  });
  final VoidCallback onLoginSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginValidationCubit, LoginValidationState>(
      listener: (context, state) {
        if (state.isLoginSuccessful) {
          onLoginSuccess();
        } else if (state.loginError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.loginError!),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       
          Text(
            AppStrings.emailAddress,
            style: TextStyle(
              fontSize: ResponsiveConfig.bodyLarge,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          
          SizedBox(height: ResponsiveConfig.paddingSM),
          
       
          BlocBuilder<LoginValidationCubit, LoginValidationState>(
            builder: (context, state) {
              return CustomTextField(
                hintText: AppStrings.enterYourEmail,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                errorText: state.emailError,
                onChanged: (value) => context.read<LoginValidationCubit>().updateEmail(value),
              );
            },
          ),
          
          SizedBox(height: ResponsiveConfig.paddingSM),
          Text(
            AppStrings.password,
            style: TextStyle(
              fontSize: ResponsiveConfig.bodyLarge,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),  
          SizedBox(height: ResponsiveConfig.paddingXS),
          BlocBuilder<LoginValidationCubit, LoginValidationState>(
            builder: (context, state) {
              return CustomTextField(
                hintText: AppStrings.enterYourPassword,
                obscureText: !state.isPasswordVisible,
                textInputAction: TextInputAction.done,
                errorText: state.passwordError,
                onChanged: (value) => context.read<LoginValidationCubit>().updatePassword(value),
                suffixIcon: IconButton(
                  icon: Icon(
                    state.isPasswordVisible 
                        ? Icons.visibility_off 
                        : Icons.visibility,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () => context.read<LoginValidationCubit>().togglePasswordVisibility(),
                ),
              );
            },
          ),
          
          SizedBox(height: ResponsiveConfig.paddingSM),
          
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
               
              },
              child: Text(
                AppStrings.forgotPassword,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).primaryColor ,
                      // No explicit color; follows TextButtonTheme (blue in light, red in dark)
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ),
          
          SizedBox(height: ResponsiveConfig.paddingSM),
          
          // Login Button (color from theme: blue in light, red in dark via ElevatedButtonTheme)
          BlocBuilder<LoginValidationCubit, LoginValidationState>(
            builder: (context, state) {
              return CustomButton(
                text: AppStrings.logIn,
                isLoading: state.isLoading,
                isEnabled: state.isFormValid,
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () => context.read<LoginValidationCubit>().validateForm(),
              );
            },
          ),
          130.square,
          // Don’t have account? Sign up
          Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  AppStrings.dontHaveBBankAccount,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                SizedBox(width: ResponsiveConfig.radiusSmall),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SignUpPage()),
                    );
                  },
                  child: Text(
                    AppStrings.signUp,
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
    );
  }
}
