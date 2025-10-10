import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/extensions/navigation_extensions.dart';
import 'package:fintechapp/core/utils/responsive_config.dart';
import 'package:fintechapp/core/widgets/custom_button.dart';
import 'package:fintechapp/features/auth/pages/signup_page.dart';
import 'package:fintechapp/features/auth/pages/widgets/otpwidget/otp_header_widget.dart';
import 'package:fintechapp/features/auth/pages/widgets/otpwidget/otp_pin_input.dart';
import 'package:fintechapp/features/auth/pages/widgets/otpwidget/otp_timer_and_resend.dart';
import 'package:fintechapp/features/auth/presentation/otp_validation_cubit/otp_cubit.dart';
import 'package:fintechapp/features/kyc/pages/kyc_country_and_document_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({required this.email, super.key});
  final String email;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => OtpCubit()..startTimer(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pushReplacement(const SignUpPage()),
          ),
          // Title moved into body header widget to keep a consistent large title style
          title:  Text(
          AppStrings.verification,
          style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
          centerTitle: true,
        ),
        body: BlocListener<OtpCubit, OtpState>(
          listenWhen: (prev, curr) => prev.isSuccess != curr.isSuccess,
          listener: (context, state) {
            if (state.isSuccess) {
         context.pushWithTransition(const KycCountryAndDocumentPage());
            }
          },
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ResponsiveConfig.paddingLG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ResponsiveConfig.paddingXL),
                  // Header with title and email info
                  OtpHeaderWidget(email: email),
                  SizedBox(height: ResponsiveConfig.paddingXL),
                  // PIN input
                  const OtpPinInput(),
                  SizedBox(height: ResponsiveConfig.paddingLG),
                  // Timer and resend link
                  const Center(child: OtpTimerAndResend()),
                  const Spacer(),
                  BlocBuilder<OtpCubit, OtpState>(
                    buildWhen: (p, c) => p.isVerifying != c.isVerifying || p.code != c.code,
                    builder: (context, state) {
                      return CustomButton(
                        text: AppStrings.verify,
                        isEnabled: state.code.length == 4 && !state.isVerifying,
                        isLoading: state.isVerifying,
                        backgroundColor: theme.primaryColor,
                        onPressed: () => context.read<OtpCubit>().verify(),
                      );
                    },
                  ),
                  SizedBox(height: ResponsiveConfig.paddingLG),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
