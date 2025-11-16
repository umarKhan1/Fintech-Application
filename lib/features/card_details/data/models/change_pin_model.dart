import 'package:fintechapp/features/card_details/domain/entities/change_pin_entities.dart';



class ChangePinModel extends ChangePinEntity {
  const ChangePinModel({
    required super.mobileNumber,
    required super.otp,
    required super.newPin,
    required super.confirmPin,
    required super.currentStep,
  });

  factory ChangePinModel.initial() {
    return const ChangePinModel(
      mobileNumber: '',
      otp: '',
      newPin: '',
      confirmPin: '',
      currentStep: 1,
    );
  }

  factory ChangePinModel.fromJson(Map<String, dynamic> json) {
    return ChangePinModel(
      mobileNumber: json['mobileNumber'] as String? ?? '',
      otp: json['otp'] as String? ?? '',
      newPin: json['newPin'] as String? ?? '',
      confirmPin: json['confirmPin'] as String? ?? '',
      currentStep: json['currentStep'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobileNumber': mobileNumber,
      'otp': otp,
      'newPin': newPin,
      'confirmPin': confirmPin,
      'currentStep': currentStep,
    };
  }

  ChangePinModel copyWith({
    String? mobileNumber,
    String? otp,
    String? newPin,
    String? confirmPin,
    int? currentStep,
  }) {
    return ChangePinModel(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      otp: otp ?? this.otp,
      newPin: newPin ?? this.newPin,
      confirmPin: confirmPin ?? this.confirmPin,
      currentStep: currentStep ?? this.currentStep,
    );
  }
}