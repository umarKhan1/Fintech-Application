import 'package:fintechapp/core/utils/responsive_config.dart';
import 'package:fintechapp/features/auth/presentation/otp_validation_cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPinInput extends StatelessWidget {
  const OtpPinInput({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<OtpCubit, OtpState>(
      buildWhen: (p, c) => p.code != c.code,
      builder: (context, state) {
        return Theme(
          data: theme.copyWith(
            inputDecorationTheme: const InputDecorationTheme(
              filled: false,
              fillColor: Colors.transparent,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
          ),
          child: PinCodeTextField(
            appContext: context,
            length: 4,
            animationType: AnimationType.fade,
            keyboardType: TextInputType.number,
            cursorColor: theme.primaryColor,
            backgroundColor: Colors.transparent,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(ResponsiveConfig.radiusSmall),
              fieldHeight: 70,
              fieldWidth: 70,
              inactiveColor: theme.primaryColor,
              selectedColor:  theme.primaryColor,
              activeColor: theme.primaryColor,
              borderWidth: 2,
            ),  
            onChanged: context.read<OtpCubit>().updateCode,
          ),
        );
      },
    );
  }
}
