import 'package:english_project/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          alignment: Alignment.centerLeft,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
        child: Text(
          label,
          style: AppStyles.h4.copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
