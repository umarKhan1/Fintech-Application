

import 'package:fintechapp/features/transfer/domain/entities/beneficiary.dart';
import 'package:fintechapp/features/transfer/domain/repositories/transfer_repositories.dart';

class GetBeneficiaries {

  GetBeneficiaries(this.repository);
  final TransferRepository repository;

  Future<List<Beneficiary>> call() async {
    // ignore: unnecessary_await_in_return
    return await repository.getBeneficiaries();
  }
}