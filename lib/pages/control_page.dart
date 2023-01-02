import 'package:english_project/utils/app_styles.dart';
import 'package:english_project/utils/app_theme.dart';
import 'package:english_project/utils/shared_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double _sliderValue = 5;

  late SharedPreferences prefs;

  void initDefaultValue() async {
    prefs = await SharedPreferences.getInstance();
    final int value = prefs.getInt(SharedKeys.counter) ?? 5;
    setState(() {
      _sliderValue = value.toDouble();
    });
  }

  void setSharedValue() async {
    await prefs.setInt(SharedKeys.counter, _sliderValue.toInt());
  }

  @override
  void initState() {
    super.initState();

    initDefaultValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlueGrey,
      appBar: AppBar(
        backgroundColor: AppColors.kBlueGrey,
        elevation: 0,
        title: Text(
          "Your control",
          style: AppStyles.h3.copyWith(
            fontSize: 36,
            color: AppColors.kBlackGrey,
          ),
        ),
        leading: InkWell(
          onTap: () {
            setSharedValue();

            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 40,
            color: AppColors.kBlueBold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const Spacer(),
            Text(
              "How much a number word at once",
              style: AppStyles.h4.copyWith(
                color: AppColors.kPrimaryColor,
              ),
            ),
            Text(
              "${_sliderValue.toInt()}",
              style: AppStyles.h1.copyWith(
                color: AppColors.kBlueBold,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: _sliderValue,
              min: 5,
              max: 100,
              divisions: 100,
              activeColor: AppColors.kBlueBold,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            const Spacer(),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "slide the set",
                style: AppStyles.h4.copyWith(
                  color: AppColors.kBlackGrey,
                ),
              ),
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
