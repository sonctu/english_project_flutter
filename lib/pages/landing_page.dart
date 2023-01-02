import 'package:english_project/pages/home_page.dart';
import 'package:english_project/utils/app_styles.dart';
import 'package:english_project/utils/app_theme.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome to",
                    style: AppStyles.h3,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "English",
                      style: AppStyles.h2.copyWith(
                        color: AppColors.kBlackGrey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Text(
                        "Quotes",
                        textAlign: TextAlign.right,
                        style: AppStyles.h4,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const HomePage())),
                          (route) => false);
                    },
                    child: const Icon(Icons.arrow_right),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
