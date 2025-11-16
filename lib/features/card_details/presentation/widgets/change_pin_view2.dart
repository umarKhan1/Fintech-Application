import 'package:fintechapp/core/constants/app_images.dart';
import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/features/card_details/presentation/cubit/changepin_cubit/change_pin_cubit.dart';
import 'package:fintechapp/features/card_details/presentation/cubit/changepin_cubit/change_pin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class ChangePinStep2 extends StatefulWidget {

  const ChangePinStep2({
    required this.mobileNumber, super.key,
  });
  final String mobileNumber;

  @override
  State<ChangePinStep2> createState() => _ChangePinStep2State();
}

class _ChangePinStep2State extends State<ChangePinStep2> {
  late TextEditingController _otpController;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _validateAndProceed() {
    setState(() {
      _errorMessage = null;
    });

    if (_otpController.text.isEmpty || _otpController.text.length < 4) {
      setState(() {
        _errorMessage = 'Please enter complete OTP';
      });
      return;
    }

    context.read<ChangePinCubit>().goToStep3(_otpController.text);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;
    final errorColor = Theme.of(context).colorScheme.error;

    return BlocListener<ChangePinCubit, ChangePinState>(
      listener: (context, state) {
        if (state is ChangePinError) {
          setState(() {
            _errorMessage = state.message;
          });
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            20.verticalSpace,
            // Header
            Text(
              AppStrings.changePin,
              style: textTheme.titleLarge?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            20.verticalSpace,

            // Image
          Container(
height: 150.h,
width: 150.w,
decoration: BoxDecoration(
color: colorScheme,
borderRadius: BorderRadius.circular(20.r),
),
child: Center(
child: Image.asset(
AppImages.changePinStep1,
height: 90.sp,
width: 90.sp,
fit: BoxFit.contain,
errorBuilder: (context, error, stackTrace) {
return Icon(
Icons.phone_iphone_rounded,
size: 80.sp,
color: colorScheme,
);
},
),
),
),
            24.verticalSpace,

            // Title
            Text(
              AppStrings.otpVerification,
              style: textTheme.titleMedium?.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            12.verticalSpace,

            // Description with mobile number
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppStrings.pleaseEnterOtp,
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 13.sp,
                        color: colorScheme.withValues(alpha:  0.6),
                      ),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: '+1 ${AppStrings.mobileNumber}',
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 13.sp,
                        color: colorScheme,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            32.verticalSpace,

            // Error Message
            if (_errorMessage != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    color: errorColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: errorColor.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        color: errorColor,
                        size: 18.sp,
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: Text(
                          _errorMessage!,
                          style: textTheme.bodySmall?.copyWith(
                            fontSize: 12.sp,
                            color: errorColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Beautiful OTP Input using pin_code_fields
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12.r),
                  fieldHeight: 60.h,
                  fieldWidth: 55.w,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: colorScheme,
                  activeColor: colorScheme,
                  inactiveColor: colorScheme.withValues(alpha: .2),
                  selectedColor: colorScheme,
                  borderWidth: 1.5,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _otpController,
                onChanged: (value) {
                  setState(() {
                    _errorMessage = null;
                  });
                },
                beforeTextPaste: (text) {
                  // Allow pasting OTP
                  return true;
                },
              ),
            ),
            24.verticalSpace,

            // Resend OTP
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('OTP resent successfully'),
                    backgroundColor: colorScheme,
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${AppStrings.dontReceiveOtp} ',
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 13.sp,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: AppStrings.resendOtp,
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            32.verticalSpace,

            // Next Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                width: double.infinity,
                height: 54.h,
                child: ElevatedButton(
                  onPressed: _validateAndProceed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    AppStrings.next,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}