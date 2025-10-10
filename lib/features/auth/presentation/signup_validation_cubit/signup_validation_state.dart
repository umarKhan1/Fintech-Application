part of 'signup_validation_cubit.dart';

class SignUpValidationState extends Equatable {
  const SignUpValidationState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.error,
    this.isPasswordVisible = false,
    this.acceptedTerms = false,
    this.isLoading = false,
    this.isFormValid = false,
    this.isSuccess = false,
  });

  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  final String? error;
  final bool isPasswordVisible;
  final bool acceptedTerms;
  final bool isLoading;
  final bool isFormValid;
  final bool isSuccess;

  SignUpValidationState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    String? error,
    bool? isPasswordVisible,
    bool? acceptedTerms,
    bool? isLoading,
    bool? isFormValid,
    bool? isSuccess,
  }) {
    return SignUpValidationState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError,
      passwordError: passwordError,
      error: error,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      acceptedTerms: acceptedTerms ?? this.acceptedTerms,
      isLoading: isLoading ?? this.isLoading,
      isFormValid: isFormValid ?? this.isFormValid,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        emailError,
        passwordError,
        error,
        isPasswordVisible,
        acceptedTerms,
        isLoading,
        isFormValid,
        isSuccess,
      ];
}
