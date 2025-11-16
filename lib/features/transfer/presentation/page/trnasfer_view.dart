import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/features/transfer/data/datasource/benficary_datasource.dart';
import 'package:fintechapp/features/transfer/data/repository/transfer_repo.dart';
import 'package:fintechapp/features/transfer/domain/usecases/get_beneficiaries.dart';
import 'package:fintechapp/features/transfer/presentation/cubit/transfer_cubit.dart';
import 'package:fintechapp/features/transfer/presentation/widget/beneficiary_selctor.dart';
import 'package:fintechapp/features/transfer/presentation/widget/transaction_type_selector.dart';
import 'package:fintechapp/features/transfer/presentation/widget/transfer_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final remoteDataSource = TransferRemoteDataSourceImpl();
        final repository = TransferRepositoryImpl(remoteDataSource: remoteDataSource);
        final getBeneficiariesUseCase = GetBeneficiaries(repository);
        return TransferCubit(getBeneficiariesUseCase: getBeneficiariesUseCase)
          ..fetchBeneficiaries();
      },
      child: const _TransferView(),
    );
  }
}

class _TransferView extends StatelessWidget {
  const _TransferView();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).primaryColor;

    return Scaffold(
   
      appBar: AppBar(
        title: const Text(AppStrings.transfer),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              Container(
                width: 300.w,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: colorScheme.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: colorScheme.withValues(alpha:  .5)),
                ),
                child: const Text('Account 1234 5678 5689'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                child: Text(
                  '${AppStrings.availableBalance}: 10,000\$',
                  style: textTheme.bodySmall?.copyWith(color: colorScheme, fontWeight: FontWeight.w600),
                ),
              ),
              24.verticalSpace,

              Text(AppStrings.chooseTransaction, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              16.verticalSpace,
              const TransactionTypeSelector(),
              32.verticalSpace,

              const BeneficiarySelector(),
              32.verticalSpace,

              const TransferInputForm(),
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}