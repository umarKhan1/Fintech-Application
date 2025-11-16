

// This is the contract that the Data layer must follow.
import 'package:fintechapp/features/transfer/domain/entities/beneficiary.dart';

// ignore: one_member_abstracts
abstract class TransferRepository {
  Future<List<Beneficiary>> getBeneficiaries();
}