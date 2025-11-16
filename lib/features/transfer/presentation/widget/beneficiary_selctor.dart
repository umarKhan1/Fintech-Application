import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/features/transfer/presentation/cubit/transfer_cubit.dart';
import 'package:fintechapp/features/transfer/presentation/cubit/transfer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BeneficiarySelector extends StatelessWidget {
  const BeneficiarySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.chooseBeneficiary, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
            Text(AppStrings.findBeneficiary,
                style: textTheme.titleSmall
                    ?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600)),
          ],
        ),
        16.verticalSpace,
        SizedBox(
          height: 90.h,
          child: BlocBuilder<TransferCubit, TransferState>(
            builder: (context, state) {
              if (state.beneficiaryStatus == DataStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.beneficiaryStatus == DataStatus.error) {
                return Center(child: Text(state.errorMessage));
              }
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.beneficiaries.length + 1,
                separatorBuilder: (_, __) => 16.horizontalSpace,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildAddButton(context);
                  }
                  final beneficiary = state.beneficiaries[index - 1];
                  return _buildBeneficiary(
                      context, beneficiary.imageUrl, beneficiary.name);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBeneficiary(
      BuildContext context, String imagePath, String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundImage: AssetImage(imagePath),
        ),
        8.verticalSpace,
        Text(name, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildAddButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          width: 60.r,
          height: 60.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.surfaceContainerHighest.withValues(alpha:  0.5),
          ),
          child: Icon(Icons.add, color: colorScheme.onSurfaceVariant),
        ),
        8.verticalSpace,
        const SizedBox.shrink(),
      ],
    );
  }
}