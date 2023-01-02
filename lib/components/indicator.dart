import 'package:english_project/utils/app_theme.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 100 : 40,
      height: 8,
      margin: const EdgeInsets.only(right: 10, bottom: 4),
      decoration: BoxDecoration(
          color: isActive ? Colors.blue : AppColors.kBlueBold,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(2, 3),
              blurRadius: 3,
            )
          ]),
    );
  }
}
