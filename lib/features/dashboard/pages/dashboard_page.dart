import 'package:fintechapp/core/constants/app_strings.dart';
import 'package:fintechapp/core/extensions/navigation_extensions.dart';
import 'package:fintechapp/core/extensions/sized_box_extension.dart';
import 'package:fintechapp/features/auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.dashboard),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Demo navigation: Push replacement back to login
              context.pushReplacement(const LoginPage());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome banner
            Container(
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).primaryColor.withValues(alpha: 0.8),
                    Theme.of(context).primaryColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Dashboard!',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Inter',
                    ),
                  ),
                  AppSpacing.heightSM,
                  Text(
                    'You have successfully navigated using custom navigation extensions',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white.withValues(alpha: 0.9),
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
            
            AppSpacing.heightXL,
            
            // Navigation demo buttons
            Text(
              'Navigation Extension Demo',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headlineLarge?.color,
                fontFamily: 'Inter',
              ),
            ),
            
            AppSpacing.heightMD,
            
            ElevatedButton(
              onPressed: () {
                // Demo: Slide transition
                context.push(const LoginPage());
              },
              child: const Text('Push with Slide (Default)'),
            ),
            
            AppSpacing.heightSM,
            
            ElevatedButton(
              onPressed: () {
                // Demo: Fade transition
                context.pushFade(const LoginPage());
              },
              child: const Text('Push with Fade'),
            ),
            
            AppSpacing.heightSM,
            
            ElevatedButton(
              onPressed: () {
                // Demo: Scale transition
                context.pushScale(const LoginPage());
              },
              child: const Text('Push with Scale'),
            ),
            
            AppSpacing.heightSM,
            
            ElevatedButton(
              onPressed: () {
                // Demo: Custom transition
                context.pushWithTransition(
                  const LoginPage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 1), // Slide from bottom
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                );
              },
              child: const Text('Push with Custom Transition (Bottom)'),
            ),
            
            AppSpacing.heightSM,
            
            ElevatedButton(
              onPressed: () {
                // Demo: Check if can pop
                if (context.canPop) {
                  context.pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cannot pop - this is the root')),
                  );
                }
              },
              child: const Text('Pop (Go Back)'),
            ),
          ],
        ),
      ),
    );
  }
}
