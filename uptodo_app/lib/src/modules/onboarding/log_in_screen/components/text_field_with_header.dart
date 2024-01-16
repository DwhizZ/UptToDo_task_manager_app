import 'package:flutter/material.dart';
import 'package:uptodo_app/src/config/themes/app_colors.dart';
import 'package:uptodo_app/src/config/themes/app_styles.dart';

class TextFieldWithHeader extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool obscureText;
  final String hint;

  const TextFieldWithHeader({super.key, 
    required this.label,
    required this.controller,
    required this.validator,
    this.obscureText = false,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            label,
            style: AppStyles.bodyStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscureText,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: AppColors.systemGrey06Dark,
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1.0), 
                borderRadius: BorderRadius.circular(5.0), 
              ),
            ),
          ),
        ),
      ],
    );
  }
}
