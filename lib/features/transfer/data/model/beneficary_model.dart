

import 'package:fintechapp/features/transfer/domain/entities/beneficiary.dart';

class BeneficiaryModel extends Beneficiary {
  const BeneficiaryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory BeneficiaryModel.fromJson(Map<String, dynamic> json) {
    return BeneficiaryModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}