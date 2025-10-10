import 'package:fintechapp/core/utils/responsive_config.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text, required this.onPressed, super.key,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
    this.height,
    this.fontSize,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.elevation,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56,
      child: ElevatedButton(
        onPressed: isEnabled && !isLoading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor ?? colorScheme.onPrimary,
          disabledBackgroundColor: backgroundColor?.withValues(alpha: 0.5) ?? colorScheme.primary.withValues(alpha: 0.5),
          disabledForegroundColor: foregroundColor?.withValues(alpha: 0.5) ?? colorScheme.onPrimary.withValues(alpha: 0.5),
          elevation: elevation ?? 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? ResponsiveConfig.radiusLarge,
            ),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    foregroundColor ?? colorScheme.onPrimary,
                  ),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize ?? ResponsiveConfig.bodyLarge,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
