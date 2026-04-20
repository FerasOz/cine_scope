import 'package:cine_scope/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField({
    super.key,
    required this.hint,
    required this.icon,
    required this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
  });

  final String hint;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: Colors.orange,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: ColorsManager.textSecondary),
        prefixIcon: Icon(icon, color: ColorsManager.textSecondary),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xFF2A2A2A),
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
