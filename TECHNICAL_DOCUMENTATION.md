# FinTech App – Technical Documentation

This document describes the work completed and provides step‑by‑step guidance for reviewers. It covers: code review notes, authentication flow implementation, KYC flow (country/document selection, document upload, selfie, verified), search implementation plan, and optimization items.

## 1. Code Review and Feedback

### Observations
- Theme consistency: Centralized in `lib/core/theme/app_theme.dart`. Light uses blue; dark uses red for primary/action components.
- Strings: Centralized in `lib/core/constants/app_strings.dart` to avoid hardcoded text.
- Responsiveness: `ScreenUtil` + `ResponsiveConfig` used across pages and widgets.
- State management: `flutter_bloc` with Cubits for validation and KYC selection.
- Folder structure: Clean architecture oriented (core, features/.../presentation/widgets, etc.).

### Issues Found & Fixes
- Duplicate/legacy auth widgets were removed and imports fixed.
- OTP page refactored to modular widgets and success navigation added.
- KYC country dropdown used incorrect border; aligned to design with radius 20 and subtle outline.
- CustomButton usage standardized; removed one misuse in KYC page.
- Added comprehensive ISO country list in `core/constants/countries.dart`.

### Recommendations
- Central router (GoRouter or onGenerateRoute) to avoid MaterialPageRoute duplication.
- Add localization (ARB + intl) once copy stabilizes.
- Extract common KYC rule row widget and upload tile to `features/kyc/widgets`.
- Add tests for Cubits (login/signup/otp/kyc) and golden tests for major screens.

## 2. Implementation of Search Functionality (Plan)

Goal: Add searchable country picker while keeping default dropdown simple.

Approach:
- Create `KycCountrySearchSheet` bottom sheet that shows:
  - Search TextField (uses theme styles; hint from `AppStrings.searchCountry`).
  - ListView of `kAllCountries` filtered as user types.
  - Tapping a country returns selection via `Navigator.pop(context, value)`.
- Integrate by adding a trailing icon to open search, or convert dropdown to a tappable field that opens the sheet.

Data/Performance:
- In‑memory list filter is O(n) and performant for ~250 countries.
- Debounce user input with `Timer` or TextEditingController listener if needed.

Files to add:
- `lib/features/kyc/widgets/kyc_country_search_sheet.dart`

## 3. Code Optimization or Additional Feature

Selected improvement: KYC flow screens (document upload → selfie → verified), fully theme‑aware and string‑centralized.

Additional optimizations to consider:
- Migrate navigation to a route generator.
- Deduplicate repeated KYC rule tiles and upload tiles.
- Extract a `ThemeColors` helper if more surfaces are added.

## 4. Implemented Features (Step‑by‑Step)

### Authentication
1. Theme finalized in `core/theme/app_theme.dart` (blue in light, red in dark).
2. Custom widgets made theme‑driven: `core/widgets/custom_text_field.dart`, `custom_button.dart`.
3. Validation moved to `features/auth/presentation/*_cubit` and integrated.
4. OTP screen modularized and success wired to Login.

### KYC
1. Added country/document selection page: `features/kyc/pages/kyc_country_and_document_page.dart` with `KycCubit`.
2. Country list added: `core/constants/countries.dart`.
3. Country dropdown widget: `features/kyc/widgets/kyc_country_dropdown.dart` with KYC‑style borders.
4. Document options widget: `features/kyc/widgets/kyc_document_option.dart` with primary color selection.
5. Upload document page: `features/kyc/pages/kyc_upload_document_page.dart` (front/back tiles, rules, continue).
6. Selfie page + Verified page: `features/kyc/pages/kyc_selfie_page.dart` (rules, continue to verified, back to home).
7. Routes: added `'/kyc'` and page pushes where needed; all copy from `AppStrings`.

## 5. How to Run
- flutter pub get
- flutter run

## 6. Next Steps
- Add country search bottom sheet and integrate with the KYC country picker.
- Integrate real image pickers (camera/gallery) with permissions.
- Hook KYC to backend: upload files, presigned URLs, and status polling.
- Add unit tests and golden tests.

## 7. File Map (Key)
- `lib/core/constants/app_strings.dart` – central strings
- `lib/core/constants/countries.dart` – country list
- `lib/core/theme/app_theme.dart` – light/dark theme
- `lib/core/widgets/custom_button.dart` – primary action button
- `lib/features/auth/...` – auth pages and cubits
- `lib/features/kyc/pages/kyc_country_and_document_page.dart` – select country/doc
- `lib/features/kyc/pages/kyc_upload_document_page.dart` – upload doc
- `lib/features/kyc/pages/kyc_selfie_page.dart` – selfie + verified
- `lib/features/kyc/widgets/...` – reusable widgets
