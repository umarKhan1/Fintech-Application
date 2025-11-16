import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/features/bottom_navigations/cubit/bottom_navigation_cubit.dart';
import 'package:fintechapp/features/dashboard/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardNavigationCubit(),
      child: const _DashboardRootView(),
    );
  }
}

class _DashboardRootView extends StatelessWidget {
  const _DashboardRootView();

  static const _pages = [
    HomeDashboardPage(),
    PlaceholderPage(label: AppStrings.search),
    PlaceholderPage(label: AppStrings.inbox),
    PlaceholderPage(label: AppStrings.settings),
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).primaryColor;

    return BlocBuilder<DashboardNavigationCubit, DashboardNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: _pages[state.currentIndex],
          bottomNavigationBar: SafeArea(
            top: false,
            child: SalomonBottomBar(
              currentIndex: state.currentIndex,
              onTap: (i) =>
                  context.read<DashboardNavigationCubit>().changeTab(i),
              selectedItemColor: scheme,
              unselectedItemColor: Theme.of(context).primaryColor.withValues(alpha: 0.6),
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home_rounded),
                  title: const Text(AppStrings.home),
                  selectedColor: scheme,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.search_rounded),
                  title: const Text(AppStrings.search),
                  selectedColor: scheme,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.mail_outline_rounded),
                  title: const Text(AppStrings.inbox),
                  selectedColor: scheme,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.settings_suggest_outlined),
                  title: const Text(AppStrings.settings),
                  selectedColor: scheme,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({required this.label, super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(label, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
