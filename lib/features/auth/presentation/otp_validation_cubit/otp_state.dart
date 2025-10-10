part of 'otp_cubit.dart';

class OtpState extends Equatable {
  const OtpState({
    required this.code,
    required this.totalSeconds,
    required this.secondsRemaining,
    required this.canResend,
    required this.isVerifying,
    required this.isSuccess,
  });

  final String code;
  final int totalSeconds;
  final int secondsRemaining;
  final bool canResend;
  final bool isVerifying;
  final bool isSuccess;

  factory OtpState.initial(int seconds) => OtpState(
        code: '',
        totalSeconds: seconds,
        secondsRemaining: seconds,
        canResend: false,
        isVerifying: false,
        isSuccess: false,
      );

  OtpState copyWith({
    String? code,
    int? totalSeconds,
    int? secondsRemaining,
    bool? canResend,
    bool? isVerifying,
    bool? isSuccess,
  }) => OtpState(
        code: code ?? this.code,
        totalSeconds: totalSeconds ?? this.totalSeconds,
        secondsRemaining: secondsRemaining ?? this.secondsRemaining,
        canResend: canResend ?? this.canResend,
        isVerifying: isVerifying ?? this.isVerifying,
        isSuccess: isSuccess ?? this.isSuccess,
      );

  @override
  List<Object?> get props => [
        code,
        totalSeconds,
        secondsRemaining,
        canResend,
        isVerifying,
        isSuccess,
      ];
}
