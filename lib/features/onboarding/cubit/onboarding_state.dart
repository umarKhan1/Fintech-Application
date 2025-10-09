import 'package:equatable/equatable.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();
  
  @override
  List<Object?> get props => [];
}

class OnboardingInitial extends OnboardingState {
  const OnboardingInitial({this.currentPage = 0});
  
  final int currentPage;
  
  @override
  List<Object?> get props => [currentPage];
}

class OnboardingPageChanged extends OnboardingState {
  const OnboardingPageChanged(this.currentPage);
  
  final int currentPage;
  
  @override
  List<Object?> get props => [currentPage];
}

class OnboardingCompleted extends OnboardingState {}
