import 'package:fintechapp/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProviders {
  static List<BlocProvider> get providers => [
    BlocProvider<OnboardingCubit>(
      create: (context) => OnboardingCubit(),
    ),
    // Add more providers here as needed
    // BlocProvider<AuthCubit>(
    //   create: (context) => AuthCubit(),
    // ),
    // BlocProvider<DashboardCubit>(
    //   create: (context) => DashboardCubit(),
    // ),
  ];
}
