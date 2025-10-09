import 'package:fintechapp/core/constants/app_images.dart';
import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/extensions/navigation_extensions.dart';
import 'package:fintechapp/core/extensions/sized_box_extension.dart';
import 'package:fintechapp/features/auth/pages/login_page.dart';
import 'package:fintechapp/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:fintechapp/features/onboarding/cubit/onboarding_state.dart';
import 'package:fintechapp/features/onboarding/models/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  final List<OnboardingContent> _onboardingData = [
    const OnboardingContent(
      title: AppStrings.onboardingTitle1,
      description: AppStrings.onboardingDescription1,
      imagePath: AppImages.onboarding1,
    ),
    const OnboardingContent(
      title: AppStrings.onboardingTitle2,
      description: AppStrings.onboardingDescription2,
      imagePath: AppImages.onboarding2,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingCompleted) {
            context.pushReplacement(const LoginPage());
          } else if (state is OnboardingPageChanged) {
            _pageController.animateToPage(
              state.currentPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          final currentPage = cubit.getCurrentPage();

          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: cubit.goToPage,
                    itemCount: _onboardingData.length,
                    itemBuilder: (context, index) {
                      final content = _onboardingData[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 5,
                              child: SizedBox(
                                width: double.infinity,

                                child: Image.asset(
                                  content.imagePath,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    // Fallback when image is not found
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Theme.of(context).primaryColor
                                                .withValues(alpha: 0.8),
                                            Theme.of(context).primaryColor,
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.credit_card,
                                          size: 120.r,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            AppSpacing.heightXXL,
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(
                                            context,
                                          ).textTheme.headlineLarge?.color,
                                          height: 1.2,
                                          fontFamily: 'Inter',
                                        ),
                                        children: _buildTitleSpans(
                                          content.title,
                                          context,
                                        ),
                                      ),
                                    ),

                                    AppSpacing.heightMD,

                                    // Description
                                    Text(
                                      content.description,
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        color: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium?.color,
                                        height: 1.5,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.h,
                    horizontal: 14.w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ...List.generate(
                                _onboardingData.length,
                                (index) => Container(
                                  width: index == currentPage ? 52.w : 8.w,
                                  height: 8.h,
                                  margin: EdgeInsets.only(right: 9.w),
                                  decoration: BoxDecoration(
                                    color: index == currentPage
                                        ? Theme.of(
                                            context,
                                          ).textTheme.headlineLarge?.color
                                        : Theme.of(context)
                                              .textTheme
                                              .headlineLarge
                                              ?.color
                                              ?.withValues(alpha: 0.3),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 150.w,
                            child: ElevatedButton(
                              onPressed: cubit.nextPage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              child: Text(
                                currentPage == _onboardingData.length - 1
                                    ? AppStrings.getStarted
                                    : AppStrings.next,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      AppSpacing.heightXL,
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<TextSpan> _buildTitleSpans(String title, BuildContext context) {
    // Split the title to highlight specific words in primary color
    if (title.contains(AppStrings.mobileBanking)) {
      return [
        TextSpan(text: title.split(AppStrings.mobileBanking)[0]),
        TextSpan(
          text: AppStrings.mobileBanking,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ];
    } else if (title.contains(AppStrings.secureTransfer)) {
      return [
        TextSpan(text: title.split(AppStrings.secureTransfer)[0]),
        TextSpan(
          text: AppStrings.secureTransfer,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ];
    }
    return [TextSpan(text: title)];
  }
}
