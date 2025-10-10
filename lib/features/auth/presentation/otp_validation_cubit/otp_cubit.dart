import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit({int seconds = 60}) : super(OtpState.initial(seconds));

  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      final remaining = state.secondsRemaining - 1;
      if (remaining <= 0) {
        t.cancel();
        emit(state.copyWith(secondsRemaining: 0, canResend: true));
      } else {
        emit(state.copyWith(secondsRemaining: remaining));
      }
    });
  }

  void updateCode(String code) {
    emit(state.copyWith(code: code));
  }

  void resend() {
    emit(state.copyWith(canResend: false, secondsRemaining: state.totalSeconds));
    startTimer();
  }

  Future<void> verify() async {
    if (state.code.length != 4) return;
    emit(state.copyWith(isVerifying: true));
    await Future.delayed(const Duration(milliseconds: 600));
    // Mock: accept any 4-digit code
    emit(state.copyWith(isVerifying: false, isSuccess: true));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
