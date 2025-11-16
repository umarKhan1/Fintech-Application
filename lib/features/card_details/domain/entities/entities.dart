import 'package:equatable/equatable.dart';

class CardDetailEntity extends Equatable {

  const CardDetailEntity({
    required this.cardId,
    required this.holderName,
    required this.cardNumber,
    required this.availableBalance,
    required this.validFrom,
    required this.validThru,
    required this.creditLimit,
    required this.cardStatus,
    required this.isLocked,
    required this.isDeactivated,
    required this.backgroundImage,
  });
  final String cardId;
  final String holderName;
  final String cardNumber;
  final double availableBalance;
  final String validFrom;
  final String validThru;
  final String creditLimit;
  final String cardStatus;
  final bool isLocked;
  final bool isDeactivated;
  final String backgroundImage;

  @override
  List<Object?> get props => [
    cardId,
    holderName,
    cardNumber,
    availableBalance,
    validFrom,
    validThru,
    creditLimit,
    cardStatus,
    isLocked,
    isDeactivated,
    backgroundImage,
  ];
}