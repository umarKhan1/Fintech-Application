import 'package:fintechapp/core/constants/app_images.dart';
import 'package:fintechapp/features/dashboard/model/card_model.dart';
import 'package:fintechapp/features/dashboard/widget/card_slider.dart';
import 'package:fintechapp/features/dashboard/widget/greeting_header.dart';
import 'package:fintechapp/features/dashboard/widget/quick_actions_card.dart';
import 'package:flutter/material.dart';


class HomeDashboardPage extends StatelessWidget {
  const HomeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    const topHeight = 195.0;
  final cardList = CardModel.sampleCards;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: topHeight,
            width: double.infinity,

          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GreetingHeader(
                    userName: 'Muhammad Omar',
                    avatarAsset:  AppImages.person,
                    notificationsCount: 3,
                  ),
                  const SizedBox(height: 8),
                  CardWalletStack( cards: cardList),
                  const SizedBox(height: 16),
                  const QuickActionsGrid(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}