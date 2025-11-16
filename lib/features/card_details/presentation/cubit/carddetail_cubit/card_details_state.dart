import 'package:equatable/equatable.dart';
import 'package:fintechapp/features/card_details/data/models/card_detailmodel.dart';

abstract class CardDetailState extends Equatable {
  const CardDetailState();

  @override
  List<Object?> get props => [];
}

class CardDetailInitial extends CardDetailState {
  const CardDetailInitial();
}

class CardDetailLoading extends CardDetailState {
  const CardDetailLoading();
}

class CardDetailLoaded extends CardDetailState {

  const CardDetailLoaded({
    required this.cardDetail,
    this.isLocked = false,
    this.isDeactivated = false,
  });
  final CardDetailModel cardDetail;
  final bool isLocked;
  final bool isDeactivated;

  CardDetailLoaded copyWith({
    CardDetailModel? cardDetail,
    bool? isLocked,
    bool? isDeactivated,
  }) {
    return CardDetailLoaded(
      cardDetail: cardDetail ?? this.cardDetail,
      isLocked: isLocked ?? this.isLocked,
      isDeactivated: isDeactivated ?? this.isDeactivated,
    );
  }

  @override
  List<Object?> get props => [cardDetail, isLocked, isDeactivated];
}

class CardDetailError extends CardDetailState {

  const CardDetailError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}

class CardDetailSaving extends CardDetailState {
  const CardDetailSaving();
}

class CardDetailSaved extends CardDetailState {
  const CardDetailSaved();
}