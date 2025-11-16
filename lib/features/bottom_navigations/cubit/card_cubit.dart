import 'package:flutter_bloc/flutter_bloc.dart';

class CardCarouselState {

  const CardCarouselState({this.currentPage = 0.0});
  final double currentPage;

  CardCarouselState copyWith({double? currentPage}) {
    return CardCarouselState(
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

class CardCarouselCubit extends Cubit<CardCarouselState> {
  CardCarouselCubit() : super(const CardCarouselState());

  void updatePage(double page) {
    emit(state.copyWith(currentPage: page));
  }
}