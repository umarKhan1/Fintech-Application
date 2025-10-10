import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/utils/responsive_config.dart';
import 'package:fintechapp/core/widgets/custom_text_field.dart';
import 'package:fintechapp/features/auth/presentation/signup_validation_cubit/signup_validation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPasswordField extends StatelessWidget {
  const SignupPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.password,
          style: TextStyle(
            fontSize: ResponsiveConfig.bodyLarge,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        SizedBox(height: ResponsiveConfig.paddingSM),
        BlocBuilder<SignUpValidationCubit, SignUpValidationState>(
          buildWhen: (p, c) => p.password != c.password || p.passwordError != c.passwordError || p.isPasswordVisible != c.isPasswordVisible,
          builder: (context, state) => CustomTextField(
            hintText: AppStrings.enterYourPassword,
            obscureText: !state.isPasswordVisible,
            errorText: state.passwordError,
            textInputAction: TextInputAction.done,
            onChanged: context.read<SignUpValidationCubit>().updatePassword,
            suffixIcon: IconButton(
              icon: Icon(state.isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).iconTheme.color),
              onPressed: () => context.read<SignUpValidationCubit>().togglePasswordVisibility(),
            ),
          ),
        ),
        SizedBox(height: ResponsiveConfig.paddingXS),
        Text(
          'At least 8 characters with uppercase letters and numbers',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
