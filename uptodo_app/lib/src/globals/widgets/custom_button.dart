import 'package:flutter/material.dart';
import 'package:uptodo_app/src/config/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.title,
  });
  final bool isLoading;
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
            color: AppColors.primaryPurple,
            borderRadius: BorderRadius.circular(4)),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
      ),
    );
  }
}
