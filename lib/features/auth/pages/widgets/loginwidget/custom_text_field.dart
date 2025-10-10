import 'package:fintechapp/core/constants/app_colors.dart';
import 'package:fintechapp/core/utils/responsive_config.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText, required this.onChanged, super.key,
    this.errorText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
  });

  final String hintText;
  final String? errorText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: theme.brightness == Brightness.dark
                ? AppColors.surfaceDark
                : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(ResponsiveConfig.radiusLarge),
            border: errorText != null
                ? Border.all(color: colorScheme.error,)
                : null,
          ),
          child: TextField(
            onChanged: onChanged,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            cursorColor: errorText != null 
                ? colorScheme.error 
                : theme.primaryColor,
            style: TextStyle(
              fontSize: ResponsiveConfig.bodyMedium,
             
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: ResponsiveConfig.bodyMedium,
               
              ),
            
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: ResponsiveConfig.paddingMD,
                vertical: ResponsiveConfig.paddingMD,
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          SizedBox(height: ResponsiveConfig.paddingXS),
          Text(
            errorText!,
            style: TextStyle(
              color: colorScheme.error,
              fontSize: ResponsiveConfig.bodySmall,
            ),
          ),
        ],
      ],
    );
  }
}
