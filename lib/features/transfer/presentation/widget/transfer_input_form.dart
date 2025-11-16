import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/features/transfer/presentation/cubit/transfer_cubit.dart';
import 'package:fintechapp/features/transfer/presentation/cubit/transfer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TransferInputForm extends StatelessWidget {
  const TransferInputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha:  0.1),
            blurRadius: 20,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: BlocBuilder<TransferCubit, TransferState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildTextField(hint: AppStrings.name),
              16.verticalSpace,
              _buildTextField(hint: AppStrings.cardNumber),
              16.verticalSpace,

              // THIS IS THE CONDITIONAL LOGIC YOU REQUESTED
              if (state.selectedType == TransferType.otherBank) ...[
                _buildDropdown(hint: AppStrings.chooseBank),
                16.verticalSpace,
                _buildDropdown(hint: AppStrings.chooseBranch),
                16.verticalSpace,
              ],

              _buildTextField(hint: AppStrings.amount),
              16.verticalSpace,
              _buildTextField(hint: AppStrings.content),
              24.verticalSpace,
              _buildSaveBeneficiary(context),
              32.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(AppStrings.confirm),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextField({required String hint}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  Widget _buildDropdown({required String hint}) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      items: const [],
      onChanged: (value) {},
      icon: const Icon(Icons.keyboard_arrow_down),
    );
  }

  Widget _buildSaveBeneficiary(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
          activeColor: Theme.of(context).colorScheme.primary,
        ),
        Text(
          AppStrings.saveToDirectory,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}