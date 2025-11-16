import 'package:fintechapp/core/constants/app_images.dart';
import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/features/card_details/data/models/card_detailmodel.dart';
import 'package:fintechapp/features/card_details/presentation/pages/card_detail_page.dart';
import 'package:fintechapp/features/dashboard/model/dashboardmodel.dart';
import 'package:fintechapp/features/transfer/presentation/page/trnasfer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
        const mockCard = CardDetailModel(
      cardId: '1',
      holderName: 'Will Jonas',
      cardNumber: '4756123456789018',
      availableBalance: 4228.76,
      validFrom: '10/25',
      validThru: '10/30',
      creditLimit: r'$271.00',
      cardStatus: 'Active',
      isLocked: false,
      isDeactivated: false,
      backgroundImage: 'assets/images/cards/card1.png',
    );
    final items = [
      ActionItem(AppImages.accountimage, AppStrings.accountAndCard),
      ActionItem(AppImages.trnasfer, AppStrings.transfer),
      ActionItem(AppImages.widhdraw, AppStrings.withdraw),
      ActionItem(AppImages.mobileprepaid, AppStrings.mobilePrepaid),
      ActionItem(AppImages.payBill, AppStrings.payTheBill),
      ActionItem(AppImages.saveMoney, AppStrings.saveOnline),
      ActionItem(AppImages.creditCard, AppStrings.creditCard),
      ActionItem(AppImages.report, AppStrings.transactionReport),
      ActionItem(AppImages.benficiary, AppStrings.beneficiary),
    ];

    final onSurface = Theme.of(context).colorScheme.onSurface.withValues(alpha:  0.7);
  

    return Padding(
      padding:  EdgeInsets.fromLTRB(10.w, 8.h, 16.w, 0),
      child: GridView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 18.h,
          crossAxisSpacing: 10.w,
          mainAxisExtent:110.h,
        ),
        itemBuilder: (context, i) {
          final it = items[i];
          return GestureDetector(
            onTap: () => handleNavigations(context, i, mockCard),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor, 
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha:  0.05),
                    blurRadius: 15.w,
                    offset:  Offset(0, 4.h),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 46.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        it.iconPath,
                    
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return   Icon(
                            Icons.error_outline,
            
                            size: 20.sp,
                          );
                        },
                      ),
                    ),
                  ),
                     20.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      it.label,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: onSurface, fontSize: 11.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  void handleNavigations(
    BuildContext context,
    int index,
    CardDetailModel mockCard,
  ) {
    switch (index) {
      case 0:
        // Navigate to Card Details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CardDetailPage(cardDetail: mockCard),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>  const TransferPage(),
          ),
        );
      
        break;
      case 2:
        // Navigate to Withdraw Screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Withdraw - Coming Soon')),
        );
        break;
      case 3:
        // Navigate to Mobile Prepaid Screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mobile Prepaid - Coming Soon')),
        );
        break;
      case 4:
        // Navigate to Pay the Bill Screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pay Bill - Coming Soon')),
        );
        break;
      case 5:
        // Navigate to Save Online Screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Save Online - Coming Soon')),
        );
        break;
      case 6:
        // Navigate to Credit Card Screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Credit Card - Coming Soon')),
        );
        break;
      case 7:
        // Navigate to Transaction Report Screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transaction Report - Coming Soon')),
        );
        break;
      case 8:
        // Navigate to Beneficiary Screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Beneficiary - Coming Soon')),
        );
        break;
      default:
        break;
    } }
}

