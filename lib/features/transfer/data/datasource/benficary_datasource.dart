
import 'package:fintechapp/core/constants/app_images.dart';
import 'package:fintechapp/features/transfer/data/model/beneficary_model.dart';

// ignore: one_member_abstracts
abstract class TransferRemoteDataSource {
  Future<List<BeneficiaryModel>> getBeneficiaries();
}

class TransferRemoteDataSourceImpl implements TransferRemoteDataSource {
  @override
  Future<List<BeneficiaryModel>> getBeneficiaries() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final staticApiResponse = [
      {'id': '1', 'name': 'Emma', 'imageUrl': AppImages.person},
      {'id': '2', 'name': 'Justin', 'imageUrl': AppImages.person},
    ];
    return staticApiResponse
        .map(BeneficiaryModel.fromJson)
        .toList();
  }
}

