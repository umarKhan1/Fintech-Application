import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/widgets/custom_button.dart';
import 'package:fintechapp/features/kyc/pages/kyc_selfie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KycUploadDocumentPage extends StatelessWidget {
  const KycUploadDocumentPage({super.key, required this.documentLabel});

  final String documentLabel; // e.g., Identity Card, Passport

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget uploadTile(String text, VoidCallback onTap) {
      return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          height: 140.h,
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
                Text(text, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ),
      );
    }

    Widget rule({required bool ok, required String text}) {
      return Row(
        children: [
          Icon(
            ok ? Icons.check : Icons.close, 
            size: 22,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyLarge,
            ),
          ),
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
              Text(
                '${AppStrings.uploadImageOf} $documentLabel',
                style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              uploadTile(AppStrings.uploadFrontPage, () {
                
              }),
              const SizedBox(height: 16),
              uploadTile(AppStrings.uploadBackPage, () {}),
              const SizedBox(height: 24),
              rule(ok: true, text: AppStrings.kycRuleGovernmentIssued),
              const SizedBox(height: 10),
              rule(ok: true, text: AppStrings.kycRuleOriginalFullSize),
              const SizedBox(height: 10),
              rule(ok: true, text: AppStrings.kycRuleSingleBackground),
              const SizedBox(height: 10),
              rule(ok: true, text: AppStrings.kycRuleReadableLitColored),
              const SizedBox(height: 10),
              rule(ok: false, text: AppStrings.kycRuleNoBlackWhite),
              const SizedBox(height: 10),
              rule(ok: false, text: AppStrings.kycRuleNoEditedExpired),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const KycSelfiePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
