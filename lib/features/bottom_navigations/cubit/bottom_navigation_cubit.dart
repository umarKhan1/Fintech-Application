import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardNavigationState {

  const DashboardNavigationState({this.currentIndex = 0});
  final int currentIndex;

  DashboardNavigationState copyWith({int? currentIndex}) {
    return DashboardNavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

class DashboardNavigationCubit extends Cubit<DashboardNavigationState> {
  DashboardNavigationCubit() : super(const DashboardNavigationState());

  void changeTab(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}