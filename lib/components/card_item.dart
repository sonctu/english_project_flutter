import 'package:english_project/utils/app_styles.dart';
import 'package:english_project/utils/app_theme.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {super.key,
      required this.size,
      required this.firstLetter,
      required this.rightLetter});

  final Size size;
  final String firstLetter, rightLetter;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.kBlueBold,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Icon(
                  Icons.heart_broken_rounded,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  text: firstLetter.toUpperCase(),
                  style: AppStyles.h1,
                  children: [
                    TextSpan(
                      text: rightLetter,
                      style: AppStyles.h2.copyWith(fontSize: 60),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "\"Think of all the beauty still left around you and be happy\"",
                style: AppStyles.h3.copyWith(
                  color: AppColors.kBlackGrey,
                  letterSpacing: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
