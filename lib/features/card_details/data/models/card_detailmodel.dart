

import 'package:fintechapp/features/card_details/domain/entities/entities.dart';

class CardDetailModel extends CardDetailEntity {
  const CardDetailModel({
    required super.cardId,
    required super.holderName,
    required super.cardNumber,
    required super.availableBalance,
    required super.validFrom,
    required super.validThru,
    required super.creditLimit,
    required super.cardStatus,
    required super.isLocked,
    required super.isDeactivated,
    required super.backgroundImage,
  });

  factory CardDetailModel.fromJson(Map<String, dynamic> json) {
    return CardDetailModel(
      cardId: json['cardId'] as String? ?? '',
      holderName: json['holderName'] as String? ?? '',
      cardNumber: json['cardNumber'] as String? ?? '',
      availableBalance: (json['availableBalance'] as num?)?.toDouble() ?? 0.0,
      validFrom: json['validFrom'] as String? ?? '',
      validThru: json['validThru'] as String? ?? '',
      creditLimit: json['creditLimit'] as String? ?? '',
      cardStatus: json['cardStatus'] as String? ?? '',
      isLocked: json['isLocked'] as bool? ?? false,
      isDeactivated: json['isDeactivated'] as bool? ?? false,
      backgroundImage: json['backgroundImage'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cardId': cardId,
      'holderName': holderName,
      'cardNumber': cardNumber,
      'availableBalance': availableBalance,
      'validFrom': validFrom,
      'validThru': validThru,
      'creditLimit': creditLimit,
      'cardStatus': cardStatus,
      'isLocked': isLocked,
      'isDeactivated': isDeactivated,
      'backgroundImage': backgroundImage,
    };
  }

  CardDetailModel copyWith({
    String? cardId,
    String? holderName,
    String? cardNumber,
    double? availableBalance,
    String? validFrom,
    String? validThru,
    String? creditLimit,
    String? cardStatus,
    bool? isLocked,
    bool? isDeactivated,
    String? backgroundImage,
  }) {
    return CardDetailModel(
      cardId: cardId ?? this.cardId,
      holderName: holderName ?? this.holderName,
      cardNumber: cardNumber ?? this.cardNumber,
      availableBalance: availableBalance ?? this.availableBalance,
      validFrom: validFrom ?? this.validFrom,
      validThru: validThru ?? this.validThru,
      creditLimit: creditLimit ?? this.creditLimit,
      cardStatus: cardStatus ?? this.cardStatus,
      isLocked: isLocked ?? this.isLocked,
      isDeactivated: isDeactivated ?? this.isDeactivated,
      backgroundImage: backgroundImage ?? this.backgroundImage,
    );
  }
}