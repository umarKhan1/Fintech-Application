import 'package:fintechapp/features/onboarding/cubit/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingInitial());

  void nextPage() {
    if (state is OnboardingInitial) {
      final currentState = state as OnboardingInitial;
      if (currentState.currentPage < 1) { // We have 2 pages (0 and 1)
        emit(OnboardingPageChanged(currentState.currentPage + 1));
      } else {
        emit(OnboardingCompleted());
      }
    } else if (state is OnboardingPageChanged) {
      final currentState = state as OnboardingPageChanged;
      if (currentState.currentPage < 1) {
        emit(OnboardingPageChanged(currentState.currentPage + 1));
      } else {
        emit(OnboardingCompleted());
      }
    }
  }

  void previousPage() {
    if (state is OnboardingPageChanged) {
      final currentState = state as OnboardingPageChanged;
      if (currentState.currentPage > 0) {
        emit(OnboardingPageChanged(currentState.currentPage - 1));
      } else {
        emit(const OnboardingInitial());
      }
    }
  }

  void skipOnboarding() {
    emit(OnboardingCompleted());
  }

  void goToPage(int page) {
    if (page == 0) {
      emit(const OnboardingInitial());
    } else {
      emit(OnboardingPageChanged(page));
    }
  }

  int getCurrentPage() {
    if (state is OnboardingInitial) {
      return (state as OnboardingInitial).currentPage;
    } else if (state is OnboardingPageChanged) {
      return (state as OnboardingPageChanged).currentPage;
    }
    return 0;
  }
}
