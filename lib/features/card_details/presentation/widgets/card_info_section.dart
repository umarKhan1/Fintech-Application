import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/features/card_details/data/models/card_detailmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CardInfoSection extends StatelessWidget {

  const CardInfoSection({
    required this.cardDetail, super.key,
  });
  final CardDetailModel cardDetail;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        // Credit Limit
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: colorScheme.withValues(alpha:  0.08),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.creditLimit,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
                8.verticalSpace,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: cardDetail.creditLimit,
                        style: TextStyle(
                          color: colorScheme,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' ${AppStrings.usd}',
                        style: TextStyle(
                          color: colorScheme,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        12.horizontalSpace,

        // Card Status
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.green.withValues( alpha:  0.08),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.cardStatus,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
                8.verticalSpace,
                Text(
                  cardDetail.cardStatus,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}