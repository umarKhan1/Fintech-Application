import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/utils/responsive_config.dart';
import 'package:fintechapp/features/auth/presentation/otp_validation_cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpTimerAndResend extends StatelessWidget {
  const OtpTimerAndResend({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<OtpCubit, OtpState>(
      buildWhen: (p, c) => p.secondsRemaining != c.secondsRemaining || p.canResend != c.canResend,
      builder: (context, state) {
        final mm = (state.secondsRemaining ~/ 60).toString().padLeft(2, '0');
        final ss = (state.secondsRemaining % 60).toString().padLeft(2, '0');
        return Column(
          children: [
            Text('$mm : $ss', style: theme.textTheme.bodyMedium),
            SizedBox(height: ResponsiveConfig.paddingSM),
            TextButton(
              onPressed: state.canResend ? () => context.read<OtpCubit>().resend() : null,
              child: Text(
                AppStrings.resendCode,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: state.canResend ? theme.primaryColor : theme.disabledColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
