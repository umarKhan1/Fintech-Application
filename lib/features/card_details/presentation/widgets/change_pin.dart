import 'package:fintechapp/core/constants/app_images.dart';
import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/features/card_details/presentation/cubit/changepin_cubit/change_pin_cubit.dart';
import 'package:fintechapp/features/card_details/presentation/cubit/changepin_cubit/change_pin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePinStep1 extends StatefulWidget {
  const ChangePinStep1({super.key});

  @override
  State<ChangePinStep1> createState() => _ChangePinStep1State();
}

class _ChangePinStep1State extends State<ChangePinStep1> {
  late TextEditingController _mobileController;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _mobileController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  void _validateAndProceed() {
    setState(() {
      _errorMessage = null;
    });

    if (_mobileController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter mobile number';
      });
      return;
    }

    context.read<ChangePinCubit>().goToStep2(_mobileController.text);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;
  final erorrColor = Theme.of(context).colorScheme.error;
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
            Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: colorScheme,
             shape: BoxShape.circle
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
              AppStrings.mobileNumber,
              style: textTheme.titleMedium?.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            5.verticalSpace,

            // Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                AppStrings.mobileNumberDescription,
                textAlign: TextAlign.center,
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 13.sp,
                color: Colors.grey,
                ),
              ),
            ),
            32.verticalSpace,

            // Mobile Number Input
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
Text(
                AppStrings.mobileNumber,
                textAlign: TextAlign.center,
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 13.sp,
                color: Colors.grey,
                ),),
15.verticalSpace,
                  // Error Message
                  if (_errorMessage != null)
                    Container(
                      padding: EdgeInsets.all(12.w),
                      margin: EdgeInsets.only(bottom: 12.h),
                      decoration: BoxDecoration(
                        color: erorrColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: erorrColor.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline_rounded,
                            color: erorrColor,
                            size: 18.sp,
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: Text(
                              _errorMessage!,
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 12.sp,
                                color: erorrColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  // Mobile Input Field
                  TextField(
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    onChanged: (_) {
                      setState(() {
                        _errorMessage = null;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Text(
                          '🇺🇸 +1',
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      hintText: '123 3698 789',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: colorScheme, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: colorScheme, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: colorScheme, width: 2),
                      ),
                    ),
                  ),
                ],
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
