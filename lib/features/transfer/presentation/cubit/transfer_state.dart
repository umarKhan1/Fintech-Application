

import 'package:fintechapp/features/transfer/domain/entities/beneficiary.dart';

enum TransferType { viaCard, sameBank, otherBank }
enum DataStatus { initial, loading, success, error }

class TransferState extends Equatable {

   TransferState({
    this.selectedType = TransferType.viaCard,
    this.beneficiaryStatus = DataStatus.initial,
    this.beneficiaries = const [],
    this.errorMessage = '',
  });
  final TransferType selectedType;
  final DataStatus beneficiaryStatus;
  final List<Beneficiary> beneficiaries;
  final String errorMessage;

  TransferState copyWith({
    TransferType? selectedType,
    DataStatus? beneficiaryStatus,
    List<Beneficiary>? beneficiaries,
    String? errorMessage,
  }) {
    return TransferState(
      selectedType: selectedType ?? this.selectedType,
      beneficiaryStatus: beneficiaryStatus ?? this.beneficiaryStatus,
      beneficiaries: beneficiaries ?? this.beneficiaries,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  List<Object> get props => [selectedType, beneficiaryStatus, beneficiaries, errorMessage];
}

class Equatable {
}