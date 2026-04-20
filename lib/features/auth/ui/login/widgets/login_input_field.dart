import 'package:cine_scope/features/auth/ui/widgets/auth_input_field.dart';
import 'package:flutter/material.dart';

class LoginInputField extends StatelessWidget {
  const LoginInputField({
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
    return AuthInputField(
      hint: hint,
      icon: icon,
      onChanged: onChanged,
      obscureText: obscureText,
      suffixIcon: suffixIcon,
    );
  }
}
