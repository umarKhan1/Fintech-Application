import 'package:fintechapp/features/dashboard/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWalletStack extends StatelessWidget {
  const CardWalletStack({required this.cards, super.key});
  final List<CardModel> cards;

  @override
  Widget build(BuildContext context) {
    final cardHeight = 190.h;
    final cardWidth = 350.w;
    final stackOffset = 12.h;

    return SizedBox(
      height: cardHeight + (cards.length * stackOffset),
      child: Stack(
        alignment: Alignment.topCenter,
        children: List.generate(cards.length, (i) {
          final reverseIndex = cards.length - 1 - i;
          return Positioned(
            top: reverseIndex * stackOffset,
            right: 7,
            child: WalletCard(
              card: cards[i],
              width: cardWidth - (reverseIndex * 8.w),
            ),
          );
        }),
      ),
    );
  }
}

class WalletCard extends StatelessWidget {
  const WalletCard({required this.card, required this.width, super.key});
  final CardModel card;
  final double width;

  String _maskCardNumber(String number) {
    if (number.length < 8) return number;
    final first4 = number.substring(0, 4);
    final last4 = number.substring(number.length - 4);
    return '$first4 •••• •••• $last4';
  }

  @override
  Widget build(BuildContext context) {
    final radius = 20.r;
    final cardHeight = 200.h;
    
    return Container(
      width: width,
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:   0.15),
            blurRadius: 24.w,
            offset: Offset(0, 12.h),
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
                card.backgroundImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.primary.withValues(alpha:  0.7),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Card content
            Padding(
              padding: EdgeInsets.only (top:  24.w, left: 50.w, bottom:  24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Holder name
                  Text(
                    card.holderName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Spacer(),
                  // Card type
                  Text(
                    card.cardType,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  12.verticalSpace,
                  // Card number
                  Text(
                    _maskCardNumber(card.cardNumber),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                  12.verticalSpace,
                  // Balance
                  Text(
                    card.balance,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
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