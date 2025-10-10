import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_validation_state.dart';

class SignUpValidationCubit extends Cubit<SignUpValidationState> {
  SignUpValidationCubit() : super(const SignUpValidationState());

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$',
  );

  void updateEmail(String email) {
    final emailError = _validateEmail(email);
    emit(state.copyWith(
      email: email,
      emailError: emailError,
      isFormValid: _isFormValid(email, state.password, state.acceptedTerms),
    ));
  }

  void updatePassword(String password) {
    final passwordError = _validatePassword(password);
    emit(state.copyWith(
      password: password,
      passwordError: passwordError,
      isFormValid: _isFormValid(state.email, password, state.acceptedTerms),
    ));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void toggleAcceptedTerms(bool value) {
    emit(state.copyWith(
      acceptedTerms: value,
      isFormValid: _isFormValid(state.email, state.password, value),
    ));
  }

  Future<void> submit() async {
    if (!state.isFormValid) return;
    emit(state.copyWith(isLoading: true));
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (_) {
      emit(state.copyWith(isLoading: false, error: 'Sign up failed. Try again.'));
    }
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';
    if (email.length > 254) return 'Email is too long';
    if (!_emailRegex.hasMatch(email)) return 'Please enter a valid email address';
    if (email.startsWith('.') || email.endsWith('.')) return 'Email cannot start or end with a dot';
    if (email.contains('..')) return 'Email cannot contain consecutive dots';
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 8) return 'At least 8 characters required';
    if (password.length > 128) return 'Password is too long';
    if (!password.contains(RegExp('[A-Z]'))) return 'Include at least one uppercase letter';
    if (!password.contains(RegExp('[a-z]'))) return 'Include at least one lowercase letter';
    if (!password.contains(RegExp('[0-9]'))) return 'Include at least one number';
    if (!password.contains(RegExp(r'[@$!%*?&]'))) return r'Include at least one special character (@$!%*?&)';
    return null;
  }

  bool _isFormValid(String email, String password, bool accepted) {
    return _validateEmail(email) == null && _validatePassword(password) == null && accepted;
  }
}
