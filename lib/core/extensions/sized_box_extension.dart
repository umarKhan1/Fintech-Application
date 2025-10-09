import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Extension on [num] to create responsive SizedBox widgets
extension SizedBoxExtension on num {
  /// Creates a responsive SizedBox with the specified height
  /// Example: 16.height
  SizedBox get height => SizedBox(height: h);

  /// Creates a responsive SizedBox with the specified width
  /// Example: 16.width
  SizedBox get width => SizedBox(width: w);

  /// Creates a responsive SizedBox with both height and width
  /// Example: 16.square
  SizedBox get square => SizedBox(height: r, width: r);
}

/// Responsive spacing constants
class AppSpacing {
  static double get xs => 4.h;
  static double get sm => 8.h;
  static double get md => 16.h;
  static double get lg => 24.h;
  static double get xl => 32.h;
  static double get xxl => 40.h;
  static double get xxxl => 60.h;
  
  // Common responsive SizedBox widgets
  static SizedBox get heightXS => SizedBox(height: xs);
  static SizedBox get heightSM => SizedBox(height: sm);
  static SizedBox get heightMD => SizedBox(height: md);
  static SizedBox get heightLG => SizedBox(height: lg);
  static SizedBox get heightXL => SizedBox(height: xl);
  static SizedBox get heightXXL => SizedBox(height: xxl);
  static SizedBox get heightXXXL => SizedBox(height: xxxl);
  
  static SizedBox get widthXS => SizedBox(width: 4.w);
  static SizedBox get widthSM => SizedBox(width: 8.w);
  static SizedBox get widthMD => SizedBox(width: 16.w);
  static SizedBox get widthLG => SizedBox(width: 24.w);
  static SizedBox get widthXL => SizedBox(width: 32.w);
  static SizedBox get widthXXL => SizedBox(width: 40.w);
  static SizedBox get widthXXXL => SizedBox(width: 60.w);
}
