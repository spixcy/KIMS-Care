import 'package:flutter/material.dart';
import 'package:kims_care/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.label,
    this.hintText,
    required this.prefixIcon,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = AppTheme.getPrimaryText(context);
    final secondaryTextColor = AppTheme.getSecondaryText(context);
    final accentColor = AppTheme.getAccent(context);
    final containerBg = isDark ? const Color(0xFF13152C) : const Color(0xFFF4F6FC);
    final borderColor = isDark ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.08);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
          child: Text(
            label,
            style: TextStyle(
              color: primaryTextColor.withOpacity(0.85),
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          style: TextStyle(
            color: primaryTextColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: secondaryTextColor.withOpacity(0.6),
              fontSize: 14,
            ),
            filled: true,
            fillColor: containerBg,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppTheme.getIconBackground(context),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  prefixIcon,
                  color: accentColor,
                  size: 20,
                ),
              ),
            ),
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: borderColor, width: 1.2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: accentColor, width: 1.8),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.8),
            ),
            errorStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class CustomDropdownField<T> extends StatelessWidget {
  final String label;
  final String? hintText;
  final IconData prefixIcon;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;

  const CustomDropdownField({
    super.key,
    required this.label,
    this.hintText,
    required this.prefixIcon,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = AppTheme.getPrimaryText(context);
    final secondaryTextColor = AppTheme.getSecondaryText(context);
    final accentColor = AppTheme.getAccent(context);
    final containerBg = isDark ? const Color(0xFF13152C) : const Color(0xFFF4F6FC);
    final borderColor = isDark ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.08);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
          child: Text(
            label,
            style: TextStyle(
              color: primaryTextColor.withOpacity(0.85),
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ),
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          validator: validator,
          dropdownColor: AppTheme.getCardColor(context),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: secondaryTextColor,
            size: 24,
          ),
          style: TextStyle(
            color: primaryTextColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: secondaryTextColor.withOpacity(0.6),
              fontSize: 14,
            ),
            filled: true,
            fillColor: containerBg,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppTheme.getIconBackground(context),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  prefixIcon,
                  color: accentColor,
                  size: 20,
                ),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: borderColor, width: 1.2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: accentColor, width: 1.8),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.8),
            ),
          ),
        ),
      ],
    );
  }
}
