import 'package:fintechapp/features/auth/presentation/login_validation_cubit/login_validation_cubit.dart';
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
    // Add more providers here as needed
    // BlocProvider<DashboardCubit>(
    //   create: (context) => DashboardCubit(),
    // ),
  ];
}
