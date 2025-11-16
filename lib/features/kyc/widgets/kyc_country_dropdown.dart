import 'package:flutter/material.dart';

class KycCountryDropdown extends StatelessWidget {
  const KycCountryDropdown({
    required this.label,
    required this.hint,
    required this.countries,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String label;
  final String hint;
  final List<String> countries;
  final String? value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderRadius = BorderRadius.circular(20); // Rounded like KYC design
    final borderColor = theme.dividerColor.withValues(alpha: 0.35); // Subtle outline in both themes

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        InputDecorator(
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.inputDecorationTheme.fillColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: borderColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: borderColor, width: 2),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: value,
              icon: Icon(Icons.arrow_drop_down, color: theme.iconTheme.color),
              items: countries
                  .map((c) => DropdownMenuItem<String>(
                        value: c,
                        child: Text(c, style: theme.textTheme.bodyLarge),
                      ))
                  .toList(),
              hint: Text(hint, style: theme.textTheme.bodyMedium),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
