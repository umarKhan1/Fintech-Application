import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/features/card_details/presentation/cubit/changepin_cubit/change_pin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ChangePinNewPinSheet extends StatefulWidget {
  const ChangePinNewPinSheet({super.key});

  @override
  State<ChangePinNewPinSheet> createState() => _ChangePinNewPinSheetState();
}

class _ChangePinNewPinSheetState extends State<ChangePinNewPinSheet> {
  final _newPinController = TextEditingController();
  final _confirmPinController = TextEditingController();
  bool _pinsMatch = false;

  @override
  void initState() {
    super.initState();
    _newPinController.addListener(_checkPins);
    _confirmPinController.addListener(_checkPins);
  }

  void _checkPins() {
    // FIX: Add a guard clause to ensure the widget is still mounted
    if (!mounted) {
      return;
    }

    final newPin = _newPinController.text;
    final confirmPin = _confirmPinController.text;
    final newMatchState = newPin.length == 5 &&
        confirmPin.length == 5 &&
        newPin == confirmPin;

    if (_pinsMatch != newMatchState) {
      setState(() {
        _pinsMatch = newMatchState;
      });
    }
  }

  @override
  void dispose() {
    _newPinController.removeListener(_checkPins);
      _confirmPinController.removeListener(_checkPins);
    _newPinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
        color: Colors.white,
      ),
  
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16.w,
          right: 16.w,
          top: 16.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Close Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.enterNewPin,
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, size: 24.sp, color: Colors.black54),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            24.verticalSpace,

            // New PIN Input
            Text(
              AppStrings.enterNewPin,
              style: textTheme.labelMedium?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            12.verticalSpace,
            _buildPinCodeFields(_newPinController, context),
            24.verticalSpace,

            // Confirm PIN Input
            Text(
              AppStrings.confirmPinCode,
              style: textTheme.labelMedium?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            12.verticalSpace,
            _buildPinCodeFields(_confirmPinController, context),
            16.verticalSpace,

            // PIN Match Status
            if (_pinsMatch)
              Row(
                children: [
                  Text(
                    AppStrings.yourPinCodesAreSame,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 13.sp,
                      color: colorScheme,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            32.verticalSpace,

            // Done Button
            SizedBox(
              width: double.infinity,
              height: 54.h,
              child: ElevatedButton(
                onPressed: _pinsMatch
                    ? () {
                        context.read<ChangePinCubit>().submitNewPin(
                              _newPinController.text,
                              _confirmPinController.text,
                            );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme,
                  disabledBackgroundColor: colorScheme.withValues(alpha:  0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  AppStrings.done,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                 color: Colors.white,
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

  Widget _buildPinCodeFields(
      TextEditingController controller, BuildContext context) {
    final colorScheme = Theme.of(context).primaryColor;

    return PinCodeTextField(
      appContext: context,
      length: 5,
      controller: controller,
      obscureText: true,
      obscuringCharacter: '*',
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.r),
        fieldHeight: 60.h,
        fieldWidth: 60.w,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.grey[100],
        selectedFillColor: Colors.white,
        activeColor: colorScheme,
        inactiveColor: colorScheme.withValues(alpha:  0.2),
        selectedColor: colorScheme,
        borderWidth: 1.5,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      onChanged: (value) {
     _checkPins();
      },
      onCompleted: (value) => _checkPins(),
    );
  }
}