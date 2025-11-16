


// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:fintechapp/features/transfer/domain/usecases/get_beneficiaries.dart';
import 'package:fintechapp/features/transfer/presentation/cubit/transfer_state.dart';

class TransferCubit extends Cubit<TransferState> {

  TransferCubit({required this.getBeneficiariesUseCase}) : super(TransferState());
  final GetBeneficiaries getBeneficiariesUseCase;

  void selectTransferType(TransferType type) {
    emit(state.copyWith(selectedType: type));
  }

  Future<void> fetchBeneficiaries() async {
    emit(state.copyWith(beneficiaryStatus: DataStatus.loading));
    try {
      final beneficiaries = await getBeneficiariesUseCase();
      emit(state.copyWith(
        beneficiaryStatus: DataStatus.success,
        beneficiaries: beneficiaries,
      ));
    } catch (e) {
      emit(state.copyWith(
        beneficiaryStatus: DataStatus.error,
        errorMessage: 'Failed to load beneficiaries',
      ));
    }
  }
}