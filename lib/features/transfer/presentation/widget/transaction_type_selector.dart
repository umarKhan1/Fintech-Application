import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/features/transfer/presentation/cubit/transfer_cubit.dart';
import 'package:fintechapp/features/transfer/presentation/cubit/transfer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TransactionTypeSelector extends StatelessWidget {
  const  TransactionTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferCubit, TransferState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTypeButton(
              context,
              title: AppStrings.transferViaCard,
              icon: Icons.credit_card,
              isSelected: state.selectedType == TransferType.viaCard,
              onTap: () => context
                  .read<TransferCubit>()
                  .selectTransferType(TransferType.viaCard),
            ),
            _buildTypeButton(
              context,
              title: AppStrings.transferToSameBank,
              icon: Icons.account_balance,
              isSelected: state.selectedType == TransferType.sameBank,
              onTap: () => context
                  .read<TransferCubit>()
                  .selectTransferType(TransferType.sameBank),
            ),
            _buildTypeButton(
              context,
              title: AppStrings.transferToAnotherBank,
              icon: Icons.business,
              isSelected: state.selectedType == TransferType.otherBank,
              onTap: () => context
                  .read<TransferCubit>()
                  .selectTransferType(TransferType.otherBank),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTypeButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 100.w,
        height: 95.h,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme : Colors.grey,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey.shade600,
              size: 30.sp,
            ),
            10.verticalSpace,
            Text(
              title,
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(
                color: isSelected ? Colors.white : Colors.grey.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}