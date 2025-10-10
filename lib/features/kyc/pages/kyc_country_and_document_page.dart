import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/constants/countries.dart';
import 'package:fintechapp/core/widgets/custom_button.dart';
import 'package:fintechapp/features/kyc/pages/kyc_upload_document_page.dart';
import 'package:fintechapp/features/kyc/presentation/cubit/kyc_cubit.dart';
import 'package:fintechapp/features/kyc/widgets/kyc_country_dropdown.dart';
import 'package:fintechapp/features/kyc/widgets/kyc_document_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KycCountryAndDocumentPage extends StatelessWidget {
  const KycCountryAndDocumentPage({super.key});

  String _labelFor(DocumentType type) {
    switch (type) {
      case DocumentType.idCard:
        return AppStrings.identityCard;
      case DocumentType.passport:
        return AppStrings.passport;
      case DocumentType.driversLicense:
        return AppStrings.driversLicense;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(AppStrings.verifyAccount, style: theme.textTheme.headlineSmall),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<KycCubit, KycState>(
            builder: (context, state) {
              final cubit = context.read<KycCubit>();
              final primary = theme.primaryColor;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KycCountryDropdown(
                  label: AppStrings.selectCountryOfResidence,
                  hint: AppStrings.selectCountry,
                  countries: kAllCountries,
                  value: state.selectedCountry,
                  onChanged: cubit.setCountry,
                  ),
                  const SizedBox(height: 24),
                  Text(AppStrings.selectGovernmentDocument, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  KycDocumentOption(
                  icon: Icons.credit_card,
                  label: AppStrings.identityCard,
                  isSelected: state.selectedType == DocumentType.idCard,
                  onTap: () => cubit.setDocumentType(DocumentType.idCard),
                  borderColor: primary,
                  ),
                  const SizedBox(height: 12),
                  KycDocumentOption(
                  icon: Icons.book,
                  label: AppStrings.passport,
                  isSelected: state.selectedType == DocumentType.passport,
                  onTap: () => cubit.setDocumentType(DocumentType.passport),
                  borderColor: primary,
                  ),
                  const SizedBox(height: 12),
                  KycDocumentOption(
                  icon: Icons.badge,
                  label: AppStrings.driversLicense,
                  isSelected: state.selectedType == DocumentType.driversLicense,
                  onTap: () => cubit.setDocumentType(DocumentType.driversLicense),
                  borderColor: primary,
                  ),
                  const Spacer(),
                  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_box_outlined, size: 20, color: theme.textTheme.bodyMedium?.color),
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
                    isEnabled: state.selectedCountry != null && state.selectedType != null,
                    backgroundColor: theme.primaryColor,
                    onPressed: () {
                      if (state.selectedType != null) {
                        final label = _labelFor(state.selectedType!);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => KycUploadDocumentPage(documentLabel: label),
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
