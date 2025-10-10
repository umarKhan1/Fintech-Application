part of 'login_validation_cubit.dart';

class LoginValidationState extends Equatable {
  const LoginValidationState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.loginError,
    this.isPasswordVisible = false,
    this.isLoading = false,
    this.isFormValid = false,
    this.isLoginSuccessful = false,
  });

  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  final String? loginError;
  final bool isPasswordVisible;
  final bool isLoading;
  final bool isFormValid;
  final bool isLoginSuccessful;

  LoginValidationState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    String? loginError,
    bool? isPasswordVisible,
    bool? isLoading,
    bool? isFormValid,
    bool? isLoginSuccessful,
  }) {
    return LoginValidationState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError,
      passwordError: passwordError,
      loginError: loginError,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoading: isLoading ?? this.isLoading,
      isFormValid: isFormValid ?? this.isFormValid,
      isLoginSuccessful: isLoginSuccessful ?? this.isLoginSuccessful,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        emailError,
        passwordError,
        loginError,
        isPasswordVisible,
        isLoading,
        isFormValid,
        isLoginSuccessful,
      ];
}
