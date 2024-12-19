import 'package:bmi_calculator/bussines/bmi_brain.dart';
import 'package:bmi_calculator/commons/reusable_button.dart';
import 'package:bmi_calculator/commons/reusable_container.dart';
import 'package:bmi_calculator/constant/constant.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final BMIBrain? args;

  const ResultScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        title: const Text('YOUR RESULT'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReusableContainerWidget(
              margin: 12,
              colour: kBackgroundCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    args?.bmiCategoryDisplay ?? '',
                    style: Theme.of(context).textTheme.bodyMedium?.merge(
                          TextStyle(
                            color: buildColorIndicator(),
                          ),
                        ),
                  ),
                  Text(
                    args?.bmiCaculatedDisplay ?? '',
                    style: kBMIDisplayTextStyle,
                  ),
                  Text(
                    args?.bmiAdviceDisplay ?? '',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: double.infinity,
            child: ReusableButtonWidget(
              enable: true,
              backgroundColor: kBackgroundButtonColor,
              child: const Text('RE-CALCULATE'),
              onPress: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }

  Color buildColorIndicator() {
    switch (args?.getCategory()) {
      case CategoriesBMI.underweightSevere || CategoriesBMI.underweightModerate:
        return Colors.red;
      case CategoriesBMI.underweightMild:
        return Colors.orange;
      case CategoriesBMI.normalRange:
        return Colors.green;
      case CategoriesBMI.overweightPre:
        return Colors.orange;
      case CategoriesBMI.obeseClassFirst ||
            CategoriesBMI.obeseClassSecond ||
            CategoriesBMI.obeseClassThird:
        return Colors.red;
      case null:
        return Colors.transparent;
    }
  }
}
