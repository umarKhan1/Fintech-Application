import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/utils/responsive_config.dart';
import 'package:fintechapp/core/widgets/custom_text_field.dart';
import 'package:fintechapp/features/auth/presentation/signup_validation_cubit/signup_validation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupEmailField extends StatelessWidget {
  const SignupEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        BlocBuilder<SignUpValidationCubit, SignUpValidationState>(
          buildWhen: (p, c) => p.email != c.email || p.emailError != c.emailError,
          builder: (context, state) => CustomTextField(
            hintText: AppStrings.enterYourEmail,
            errorText: state.emailError,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onChanged: context.read<SignUpValidationCubit>().updateEmail,
          ),
        ),
      ],
    );
  }
}
