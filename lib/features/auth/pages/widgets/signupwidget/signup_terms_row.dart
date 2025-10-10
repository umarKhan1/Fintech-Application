import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/features/auth/presentation/signup_validation_cubit/signup_validation_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupTermsRow extends StatelessWidget {
  const SignupTermsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;

    return BlocBuilder<SignUpValidationCubit, SignUpValidationState>(
      buildWhen: (p, c) => p.acceptedTerms != c.acceptedTerms,
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
              value: state.acceptedTerms,
              onChanged: (v) => context.read<SignUpValidationCubit>().toggleAcceptedTerms(v ?? false),
              activeColor: primary,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: theme.textTheme.bodyMedium,
                  children: [
                    const TextSpan(text: AppStrings.accept),
                    TextSpan(
                      text: AppStrings.termsOfUse,
                      style: TextStyle(color: primary, fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    const TextSpan(text: ' & '),
                    TextSpan(
                      text: AppStrings.privacyPolicy,
                      style: TextStyle(color: primary, fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
