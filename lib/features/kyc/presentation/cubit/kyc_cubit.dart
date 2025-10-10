import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'kyc_state.dart';

class KycCubit extends Cubit<KycState> {
  KycCubit() : super(const KycState());

  void setCountry(String? country) {
    emit(state.copyWith(selectedCountry: country));
  }

  void setDocumentType(DocumentType? type) {
    emit(state.copyWith(selectedType: type));
  }

  bool get canContinue => state.selectedCountry != null && state.selectedType != null;
}
