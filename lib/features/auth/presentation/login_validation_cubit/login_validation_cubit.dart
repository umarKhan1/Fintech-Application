
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_validation_state.dart';

class LoginValidationCubit extends Cubit<LoginValidationState> {
  LoginValidationCubit() : super(const LoginValidationState());

  // Email regex pattern for comprehensive validation
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$',
  );

  void updateEmail(String email) {
    final emailError = _validateEmail(email);
    emit(state.copyWith(
      email: email,
      emailError: emailError,
      isFormValid: _isFormValid(email, state.password),
    ));
  }

  void updatePassword(String password) {
    final passwordError = _validatePassword(password);
    emit(state.copyWith(
      password: password,
      passwordError: passwordError,
      isFormValid: _isFormValid(state.email, password),
      isPasswordVisible: state.isPasswordVisible,
    ));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> validateForm() async {
    if (!state.isFormValid) return;

    emit(state.copyWith(isLoading: true));

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Form is valid, emit success state
      emit(state.copyWith(
        isLoading: false,
        isLoginSuccessful: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        loginError: 'Validation failed. Please try again.',
      ));
    }
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    }
    
    if (email.length > 254) {
      return 'Email is too long';
    }
    
    if (!_emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    
    // Additional email validations
    if (email.startsWith('.') || email.endsWith('.')) {
      return 'Email cannot start or end with a dot';
    }
    
    if (email.contains('..')) {
      return 'Email cannot contain consecutive dots';
    }
    
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    
    if (password.length > 128) {
      return 'Password is too long (max 128 characters)';
    }
    
    if (!password.contains(RegExp('[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    
    if (!password.contains(RegExp('[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    
    if (!password.contains(RegExp('[0-9]'))) {
      return 'Password must contain at least one number';
    }
    
 
    
    // Check for common weak passwords
    final commonPasswords = [
      'password', '12345678', 'qwerty', 'abc123', 'password123',
      'admin', 'letmein', 'welcome', '123456789', 'password1'
    ];
    
    if (commonPasswords.contains(password.toLowerCase())) {
      return 'Password is too common. Please choose a stronger password';
    }
    
    return null;
  }

  bool _isFormValid(String email, String password) {
    return _validateEmail(email) == null && _validatePassword(password) == null;
  }

  void resetForm() {
    emit(const LoginValidationState());
  }
}
