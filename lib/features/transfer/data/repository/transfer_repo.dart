

import 'package:fintechapp/features/transfer/data/datasource/benficary_datasource.dart';
import 'package:fintechapp/features/transfer/domain/entities/beneficiary.dart';
import 'package:fintechapp/features/transfer/domain/repositories/transfer_repositories.dart';

class TransferRepositoryImpl implements TransferRepository {

  TransferRepositoryImpl({required this.remoteDataSource});
  final TransferRemoteDataSource remoteDataSource;

  @override
  Future<List<Beneficiary>> getBeneficiaries() async {
    return remoteDataSource.getBeneficiaries();
  }
}