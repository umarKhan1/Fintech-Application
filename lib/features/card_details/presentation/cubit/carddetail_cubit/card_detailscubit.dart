
import 'package:fintechapp/features/card_details/data/models/card_detailmodel.dart';
import 'package:fintechapp/features/card_details/presentation/cubit/carddetail_cubit/card_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CardDetailCubit extends Cubit<CardDetailState> {
  CardDetailCubit() : super(const CardDetailInitial());

  void loadCardDetail(CardDetailModel cardDetail) {
    try {
      emit(CardDetailLoaded(
        cardDetail: cardDetail,
        isLocked: cardDetail.isLocked,
        isDeactivated: cardDetail.isDeactivated,
      ));
    } catch (e) {
      emit(CardDetailError('Failed to load card details: $e'));
    }
  }

  void toggleLockCard() {
    if (state is CardDetailLoaded) {
      final currentState = state as CardDetailLoaded;
      emit(currentState.copyWith(isLocked: !currentState.isLocked));
    }
  }

  void toggleDeactivateCard() {
    if (state is CardDetailLoaded) {
      final currentState = state as CardDetailLoaded;
      emit(currentState.copyWith(isDeactivated: !currentState.isDeactivated));
    }
  }

  Future<void> saveCardSettings() async {
    if (state is CardDetailLoaded) {
      final currentState = state as CardDetailLoaded;
      emit(const CardDetailSaving());

      try {
        // Simulate API call with delay
        await Future.delayed(const Duration(milliseconds: 800));
        
        emit(const CardDetailSaved());
        
        // Emit loaded state after saving
        await Future.delayed(const Duration(milliseconds: 500));
        emit(currentState);
      } catch (e) {
        emit(CardDetailError('Failed to save settings: $e'));
      }
    }
  }
}