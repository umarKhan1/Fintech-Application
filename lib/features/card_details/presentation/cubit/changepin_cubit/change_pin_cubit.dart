
import 'package:fintechapp/features/card_details/data/models/change_pin_model.dart';
import 'package:fintechapp/features/card_details/presentation/cubit/changepin_cubit/change_pin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChangePinCubit extends Cubit<ChangePinState> {
  ChangePinCubit() : super(const ChangePinInitial());

  ChangePinModel _currentData = ChangePinModel.initial();

  void initializeStep1() {
    _currentData = ChangePinModel.initial();
    emit(ChangePinStep1Loaded(_currentData));
  }

  void goToStep2(String mobileNumber) {
    try {
      if (mobileNumber.isEmpty) {
        emit(const ChangePinError('Please enter mobile number'));
        emit(ChangePinStep1Loaded(_currentData));
        return;
      }
      _currentData = _currentData.copyWith(
        mobileNumber: mobileNumber,
        currentStep: 2,
      );
      emit(ChangePinStep2Loaded(_currentData));
    } catch (e) {
      emit(ChangePinError('Error: $e'));
      emit(ChangePinStep1Loaded(_currentData));
    }
  }

  void goToStep3(String otp) {
    try {
      if (otp.isEmpty || otp.length < 4) {
        emit(const ChangePinError('Please enter complete OTP'));
        emit(ChangePinStep2Loaded(_currentData));
        return;
      }
      _currentData = _currentData.copyWith(
        otp: otp,
        currentStep: 3,
      );
      emit(ChangePinShowNewPinSheet(_currentData));
    } catch (e) {
      emit(ChangePinError('Error: $e'));
      emit(ChangePinStep2Loaded(_currentData));
    }
  }

  Future<void> submitNewPin(String newPin, String confirmPin) async {
    try {
      if (newPin.isEmpty || confirmPin.isEmpty) {
        emit(const ChangePinError('Please enter PIN and confirm PIN'));
        emit(ChangePinShowNewPinSheet(_currentData));
        return;
      }

      if (newPin != confirmPin) {
        emit(const ChangePinError('PINs do not match'));
        emit(ChangePinShowNewPinSheet(_currentData));
        return;
      }

      if (newPin.length < 4) {
        emit(const ChangePinError('PIN must be at least 4 digits'));
        emit(ChangePinShowNewPinSheet(_currentData));
        return;
      }

      emit(const ChangePinLoading());

      await Future.delayed(const Duration(milliseconds: 800));

      _currentData = _currentData.copyWith(
        newPin: newPin,
        confirmPin: confirmPin,
      );

      emit(const ChangePinSuccess());
    } catch (e) {
      emit(ChangePinError('Failed to update PIN: $e'));
      emit(ChangePinShowNewPinSheet(_currentData));
    }
  }

  void goBack() {
    if (_currentData.currentStep > 1) {
      final newStep = _currentData.currentStep - 1;
      _currentData = _currentData.copyWith(currentStep: newStep);

      if (newStep == 1) {
        emit(ChangePinStep1Loaded(_currentData));
      } else if (newStep == 2) {
        emit(ChangePinStep2Loaded(_currentData));
      }
    }
  }
}