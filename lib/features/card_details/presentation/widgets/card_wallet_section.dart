import 'package:fintechapp/features/card_details/data/models/card_detailmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CardWalletSection extends StatelessWidget {

  const CardWalletSection({
    required this.cardDetail, super.key,
  });
  final CardDetailModel cardDetail;

  String _maskCardNumber(String number) {
    if (number.length < 8) return number;
    final first4 = number.substring(0, 4);
    final last4 = number.substring(number.length - 4);
    return '$first4 •••• •••• $last4';
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).primaryColor;
    const radius = 20.0;

    return Container(
      width: double.infinity,
      height: 220.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: colorScheme.withValues(alpha:  0.1),
            blurRadius: 20.w,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                cardDetail.backgroundImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colorScheme,
                          colorScheme.withValues(alpha:  0.7),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Card content
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top: Holder name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Card Holder',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha:  0.8),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        cardDetail.holderName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // Middle: Card number and balance
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _maskCardNumber(cardDetail.cardNumber),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                      ),
                      12.verticalSpace,
                      Text(
                        'Available Balance',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha:  0.8),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        '\$${cardDetail.availableBalance.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // Bottom: Valid dates and VISA logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Valid From',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha:  0.7),
                              fontSize: 10.sp,
                            ),
                          ),
                          2.verticalSpace,
                          Text(
                            cardDetail.validFrom,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Valid Thru',
                            style: TextStyle(
                              color: Colors.white.withValues( alpha: .7),
                              fontSize: 10.sp,
                            ),
                          ),
                          2.verticalSpace,
                          Text(
                            cardDetail.validThru,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'VISA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}