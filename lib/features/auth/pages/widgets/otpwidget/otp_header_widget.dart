import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class OtpHeaderWidget extends StatelessWidget {
  const OtpHeaderWidget({required this.email, super.key});

  final String email;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        const SizedBox(height: 8),
        Text(
          AppStrings.codeSentToEmail,
          style: theme.textTheme.bodyMedium,
        ),
        Text(
          email,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.primaryColor
          ),
        ),
      ],
    );
  }
}
