import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/features/card_details/data/models/card_detailmodel.dart';
import 'package:fintechapp/features/card_details/presentation/cubit/carddetail_cubit/card_details_state.dart';
import 'package:fintechapp/features/card_details/presentation/cubit/carddetail_cubit/card_detailscubit.dart';
import 'package:fintechapp/features/card_details/presentation/widgets/card_info_section.dart';
import 'package:fintechapp/features/card_details/presentation/widgets/card_setting.dart';
import 'package:fintechapp/features/card_details/presentation/widgets/card_wallet_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CardDetailPage extends StatelessWidget {

  const CardDetailPage({
    required this.cardDetail, super.key,
  });
  final CardDetailModel cardDetail;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CardDetailCubit()..loadCardDetail(cardDetail),
      child: const _CardDetailView(),
    );
  }
}

class _CardDetailView extends StatelessWidget {
  const _CardDetailView();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colorScheme.onSurface,
            size: 24.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppStrings.myCard,
          style: textTheme.titleLarge?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.notifications_none_rounded,
                  color: colorScheme.onSurface,
                  size: 24.sp,
                ),
                Positioned(
                  right: -2.w,
                  top: -2.h,
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: colorScheme.error,
                      shape: BoxShape.circle,
                    ),
                    child: SizedBox(
                      width: 6.w,
                      height: 6.h,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          8.horizontalSpace,
        ],
      ),
      body: BlocListener<CardDetailCubit, CardDetailState>(
        listener: (context, state) {
          if (state is CardDetailError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: colorScheme.error,
              ),
            );
          }
          if (state is CardDetailSaved) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(AppStrings.cardSettingsSaved),
                backgroundColor: colorScheme.primary,
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        child: BlocBuilder<CardDetailCubit, CardDetailState>(
          builder: (context, state) {
            if (state is CardDetailLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: colorScheme.primary,
                ),
              );
            }

            if (state is CardDetailError) {
              return Center(
                child: Text(
                  state.message,
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (state is CardDetailLoaded) {
              return SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Card Wallet Section
                      CardWalletSection(cardDetail: state.cardDetail),
                      24.verticalSpace,

                      // Dots indicator
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8.w,
                              height: 3.h,
                              decoration: BoxDecoration(
                                color: colorScheme.primary,
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                            4.horizontalSpace,
                            Container(
                              width: 8.w,
                              height: 3.h,
                              decoration: BoxDecoration(
                                color: colorScheme.onSurface.withValues(alpha:  0.2),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                          ],
                        ),
                      ),
                      24.verticalSpace,

                      // Card Info Section (Credit Limit & Status)
                      CardInfoSection(cardDetail: state.cardDetail),
                      24.verticalSpace,

                      // Settings Section
                      CardSettingsSection(
                        cardDetail: state.cardDetail,
                        isLocked: state.isLocked,
                        isDeactivated: state.isDeactivated,
                      ),
                      24.verticalSpace,

                      // Save Button
                      SizedBox(
                        width: double.infinity,
                        height: 54.h,
                        child: BlocBuilder<CardDetailCubit, CardDetailState>(
                          builder: (context, state) {
                            final isSaving = state is CardDetailSaving;

                            return ElevatedButton(
                              onPressed: isSaving
                                  ? null
                                  : () {
                                      context
                                          .read<CardDetailCubit>()
                                          .saveCardSettings();
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                elevation: 0,
                              ),
                              child: isSaving
                                  ? SizedBox(
                                      width: 24.w,
                                      height: 24.h,
                                      child: CircularProgressIndicator(
                                        color: colorScheme.onPrimary,
                                        strokeWidth: 2.w,
                                      ),
                                    )
                                  : Text(
                                      AppStrings.save,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: colorScheme.onPrimary,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                      24.verticalSpace,
                    ],
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}