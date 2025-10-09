// ignore_for_file: prefer_int_literals

import 'package:flutter/material.dart';

/// Navigation extension for cleaner navigation without using MaterialPageRoute directly
extension NavigationExtensions on BuildContext {
  /// Push a new page with slide transition
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.of(this).push<T>(
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween.chain(
            CurveTween(curve: curve),
          ));

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  /// Push a new page with fade transition
  Future<T?> pushFade<T extends Object?>(Widget page) {
    return Navigator.of(this).push<T>(
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  /// Push a new page with scale transition
  Future<T?> pushScale<T extends Object?>(Widget page) {
    return Navigator.of(this).push<T>(
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const curve = Curves.elasticOut;
          final tween = Tween<double>(begin: 0.0, end: 1.0);
          final scaleAnimation = animation.drive(tween.chain(
            CurveTween(curve: curve),
          ));

          return ScaleTransition(
            scale: scaleAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  /// Push and replace current page with slide transition
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page, {
    TO? result,
  }) {
    return Navigator.of(this).pushReplacement<T, TO>(
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween.chain(
            CurveTween(curve: curve),
          ));

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
      result: result,
    );
  }

  /// Push and clear all previous routes
  Future<T?> pushAndClearStack<T extends Object?>(Widget page) {
    return Navigator.of(this).pushAndRemoveUntil<T>(
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      (route) => false,
    );
  }

  /// Pop current page
  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  /// Pop until specific route
  void popUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  /// Pop and push replacement
  Future<T?> popAndPush<T extends Object?, TO extends Object?>(
    Widget page, {
    TO? result,
  }) {
    Navigator.of(this).pop<TO>(result);
    return push<T>(page);
  }

  /// Check if can pop
  bool get canPop => Navigator.of(this).canPop();

  /// Push with custom transition
  Future<T?> pushWithTransition<T extends Object?>(
    Widget page, {
    RouteTransitionsBuilder? transitionsBuilder,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
  }) {
    return Navigator.of(this).push<T>(
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: transitionsBuilder ??
            (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
        transitionDuration: transitionDuration,
        reverseTransitionDuration: reverseTransitionDuration,
      ),
    );
  }

  /// Navigate with named route (if using named routes)
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  /// Push replacement with named route
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    Object? arguments,
    TO? result,
  }) {
    return Navigator.of(this).pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  /// Push and remove until with named route
  Future<T?> pushNamedAndClearStack<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
}

/// Predefined transition builders for common animations
class AppTransitions {
  static RouteTransitionsBuilder get slideFromRight =>
      (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween.chain(
          CurveTween(curve: curve),
        ));

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      };

  static RouteTransitionsBuilder get slideFromLeft =>
      (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween.chain(
          CurveTween(curve: curve),
        ));

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      };

  static RouteTransitionsBuilder get slideFromBottom =>
      (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween.chain(
          CurveTween(curve: curve),
        ));

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      };

  static RouteTransitionsBuilder get fadeIn =>
      (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      };

  static RouteTransitionsBuilder get scaleIn =>
      (context, animation, secondaryAnimation, child) {
        const curve = Curves.elasticOut;
        final tween = Tween(begin: 0.0, end: 1.0);
        final scaleAnimation = animation.drive(tween.chain(
          CurveTween(curve: curve),
        ));

        return ScaleTransition(
          scale: scaleAnimation,
          child: child,
        );
      };

  static RouteTransitionsBuilder get rotateIn =>
      (context, animation, secondaryAnimation, child) {
        final rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.elasticOut),
        );

        return RotationTransition(
          turns: rotationAnimation,
          child: child,
        );
      };
}
