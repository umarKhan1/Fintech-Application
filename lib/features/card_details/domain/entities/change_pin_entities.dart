import 'package:equatable/equatable.dart';

class ChangePinEntity extends Equatable { 

  const ChangePinEntity({
    required this.mobileNumber,
    required this.otp,
    required this.newPin,
    required this.confirmPin,
    required this.currentStep,
  });
  final String mobileNumber;
  final String otp;
  final String newPin;
  final String confirmPin;
  final int currentStep;

  @override
  List<Object?> get props => [
    mobileNumber,
    otp,
    newPin,
    confirmPin,
    currentStep,
  ];
}