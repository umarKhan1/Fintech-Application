import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/extensions/navigation_extensions.dart';
import 'package:fintechapp/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class KycSelfiePage extends StatelessWidget {
  const KycSelfiePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget uploadSelfieTile() {
      return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            color: theme.inputDecorationTheme.fillColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.photo_camera_outlined, color: theme.iconTheme.color, size: 28),
                const SizedBox(height: 8),
                Text(AppStrings.uploadPortraitPhoto, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ),
      );
    }

    Widget rule({required bool ok, required String text}) {
      return Row(
        children: [
          Icon(ok ? Icons.check : Icons.close, color: ok ? theme.primaryColor : theme.colorScheme.error, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: theme.textTheme.bodyLarge)),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(AppStrings.verifyAccount, style: theme.textTheme.headlineSmall),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.takeSelfiePhoto, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 16),
              uploadSelfieTile(),
              const SizedBox(height: 24),
              rule(ok: true, text: AppStrings.selfieRuleNeutralExpression),
              const SizedBox(height: 10),
              rule(ok: true, text: AppStrings.selfieRuleVisibleFace),
              const SizedBox(height: 10),
              rule(ok: false, text: AppStrings.selfieRuleNoCropIdScreenshots),
              const SizedBox(height: 10),
              rule(ok: false, text: AppStrings.selfieRuleNoHideAlterFace),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_box, size: 20, color: theme.primaryColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      AppStrings.kycInfoNote,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              CustomButton(
                text: AppStrings.continueLabel,
                backgroundColor: theme.primaryColor,
                onPressed: () {
              context.push( const KycVerifiedPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KycVerifiedPage extends StatelessWidget {
  const KycVerifiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: theme.iconTheme.color),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
              // Placeholder illustration; replace with asset if available
              Icon(Icons.verified, size: 120, color: theme.primaryColor),
              const SizedBox(height: 24),
              Text(AppStrings.youAreVerifiedTitle, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text(
                AppStrings.youAreVerifiedMessage,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: AppStrings.backToHome,
                  backgroundColor: theme.primaryColor,
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
