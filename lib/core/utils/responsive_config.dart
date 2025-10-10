import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Responsive design configuration and utilities
class ResponsiveConfig {
  // Design reference size (iPhone 11 Pro)
  static const double designWidth = 375;
  static const double designHeight = 812;
  
  // Common responsive values
  static double get screenWidth => 1.sw;
  static double get screenHeight => 1.sh;
  
  // Typography scale
  static double get titleLarge => 32.sp;
  static double get titleMedium => 24.sp;
  static double get titleSmall => 20.sp;
  static double get bodyLarge => 16.sp;
  static double get bodyMedium => 14.sp;
  static double get bodySmall => 12.sp;
  static double get caption => 10.sp;
  
  // Icon sizes
  static double get iconSmall => 16.r;
  static double get iconMedium => 24.r;
  static double get iconLarge => 32.r;
  static double get iconXLarge => 48.r;
  static double get iconXXLarge => 64.r;
  
  // Border radius
  static double get radiusSmall => 4.r;
  static double get radiusMedium => 8.r;
  static double get radiusLarge => 12.r;
  static double get radiusXLarge => 16.r;
  static double get radiusXXLarge => 20.r;
  
  // Common paddings
  static double get paddingXS => 4.r;
  static double get paddingSM => 8.r;
  static double get paddingMD => 16.r;
  static double get paddingLG => 24.r;
  static double get paddingXL => 32.r;
  static double get paddingXXL => 40.r;
  
  // Device type detection
  static bool get isMobile => screenWidth < 600;
  static bool get isTablet => screenWidth >= 600 && screenWidth < 1200;
  static bool get isDesktop => screenWidth >= 1200;
  
  // Image sizes
  static double get logoSmall => 100.r;
  static double get logoMedium => 150.r;
  static double get logoLarge => 200.r;
  
  // Custom responsive image size for specific dimensions
  static Size responsiveImageSize({
    required double height,
    required double width,
  }) {
    return Size(width.w, height.h);
  }

  // Responsive values based on device type
  static double responsiveValue({
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }
}

/// Extension for responsive EdgeInsets
extension ResponsiveEdgeInsets on EdgeInsets {
  static EdgeInsets responsive({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return EdgeInsets.only(
      top: (top ?? vertical ?? all ?? 0).h,
      bottom: (bottom ?? vertical ?? all ?? 0).h,
      left: (left ?? horizontal ?? all ?? 0).w,
      right: (right ?? horizontal ?? all ?? 0).w,
    );
  }
}
