import 'package:fintechapp/features/auth/presentation/login_validation_cubit/login_validation_cubit.dart';
import 'package:fintechapp/features/bottom_navigations/cubit/bottom_navigation_cubit.dart';
import 'package:fintechapp/features/bottom_navigations/cubit/card_cubit.dart';
import 'package:fintechapp/features/card_details/presentation/cubit/changepin_cubit/change_pin_cubit.dart';
import 'package:fintechapp/features/kyc/presentation/cubit/kyc_cubit.dart';
import 'package:fintechapp/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProviders {
  static List<BlocProvider> get providers => [
    BlocProvider<OnboardingCubit>(
      create: (context) => OnboardingCubit(),
    ),
    BlocProvider<LoginValidationCubit>(
      create: (context) => LoginValidationCubit(),
    ),
    BlocProvider<KycCubit>(
      create: (context) => KycCubit(),
    ),

    BlocProvider<DashboardNavigationCubit>(
      create: (context) => DashboardNavigationCubit(),
    ),  
    BlocProvider<CardCarouselCubit>(
      create: (context) => CardCarouselCubit(),
    ),
    BlocProvider<ChangePinCubit>(create: (context)=> ChangePinCubit()..initializeStep1()),
    // Add more providers here as needed
    // BlocProvider<DashboardCubit>(
    //   create: (context) => DashboardCubit(),
    // ),
  ];
}
