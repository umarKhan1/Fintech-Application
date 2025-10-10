part of 'kyc_cubit.dart';

enum DocumentType { idCard, passport, driversLicense }

class KycState extends Equatable {
  const KycState({
    this.selectedCountry,
    this.selectedType,
  });

  final String? selectedCountry;
  final DocumentType? selectedType;

  KycState copyWith({
    String? selectedCountry,
    DocumentType? selectedType,
  }) => KycState(
    selectedCountry: selectedCountry ?? this.selectedCountry,
    selectedType: selectedType ?? this.selectedType,
  );

  @override
  List<Object?> get props => [selectedCountry, selectedType];
}
