import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/extensions/navigation_extensions.dart';
import 'package:fintechapp/features/card_details/data/models/card_detailmodel.dart';
import 'package:fintechapp/features/card_details/presentation/cubit/carddetail_cubit/card_detailscubit.dart';
import 'package:fintechapp/features/card_details/presentation/pages/change_pin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CardSettingsSection extends StatelessWidget {

  const CardSettingsSection({
    required this.cardDetail, required this.isLocked, required this.isDeactivated, super.key,
  });
  final CardDetailModel cardDetail;
  final bool isLocked;
  final bool isDeactivated;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.settings,
          style: textTheme.titleMedium?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        16.verticalSpace,

        // Change PIN
        _SettingTile(
          icon: Icons.security_rounded,
          iconBgColor: colorScheme.withValues(alpha:  0.08),
          iconColor: colorScheme,
          title: AppStrings.changePin,
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18.sp,
            color: colorScheme,
          ),
          onTap: () {
        context.push(const ChangePinPage());
          },
        ),
        16.verticalSpace,

        // Lock Card
        _SettingTile(
          icon: Icons.lock_rounded,
          iconBgColor: colorScheme.withValues(alpha: 0.08),
          iconColor: colorScheme,
          title: AppStrings.lockCard,
          trailing: Transform.scale(
            scale: 0.85,
            child: Switch(
              value: isLocked,
              onChanged: (value) {
                context.read<CardDetailCubit>().toggleLockCard();
              },
              activeThumbColor: colorScheme,
            ),
          ),
          onTap: () {
            context.read<CardDetailCubit>().toggleLockCard();
          },
        ),
        16.verticalSpace,

        // Deactivate Card
        _SettingTile(
          icon: Icons.block_rounded,
          iconBgColor: colorScheme.withValues(alpha:  0.08),
          iconColor: colorScheme,
          title: AppStrings.deactivateCard,
          trailing: Transform.scale(
            scale: 0.85,
            child: Switch(
              value: isDeactivated,
              onChanged: (value) {
                context.read<CardDetailCubit>().toggleDeactivateCard();
              },
              activeThumbColor: colorScheme,
            ),
          ),
          onTap: () {
            context.read<CardDetailCubit>().toggleDeactivateCard();
          },
        ),
      ],
    );
  }
}

class _SettingTile extends StatelessWidget {

  const _SettingTile({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    required this.trailing,
    required this.onTap,
  });
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final Widget trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: colorScheme.onSurface.withValues(alpha:  0.05),
              blurRadius: 8.w,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: iconColor, size: 22.sp),
            ),
            16.horizontalSpace,
            Expanded(
              child: Text(
                title,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}