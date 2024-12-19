import 'package:bmi_calculator/commons/vertical_spacing.dart';
import 'package:flutter/material.dart';
import '../../constant/constant.dart';
import '../../bussines/bmi_brain.dart';
import '../../commons/horizontal_spacing.dart';
import '../../commons/minus_plus_buttons.dart';
import '../../commons/reusable_button.dart';
import '../../commons/reusable_container.dart';
import '../../commons/icon_text_vertical.dart';
import '../../commons/text_title.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  BMIBrain bmiBrain = BMIBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.black,
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                // Sex Selection section
                _buildGenderSelectionSection(),
                VerticalSpacing.large(),
                // Height section
                _buildHeightSection(),
                VerticalSpacing.large(),
                // Weight & Age section
                _buildWeightAndAgeSection(),
              ],
            ),
          ),
          const Spacer(),
          _buildCalculateButton()
        ],
      ),
    );
  }

  Row _buildWeightAndAgeSection() {
    return Row(
      children: [
        _buildWeightContainer(),
        const HorizontalSpacing(),
        _buildAgeContainer()
      ],
    );
  }

  Container _buildCalculateButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      child: ReusableButtonWidget(
        backgroundColor: kBackgroundButtonColor,
        enable: true,
        child: const Text('Calculate Your BMI'),
        onPress: () {
          bmiBrain.calculateBMI();
          Navigator.pushNamed(
            context,
            '/resultscreen',
            arguments: bmiBrain,
          );
        },
      ),
    );
  }

  Expanded _buildAgeContainer() {
    return Expanded(
      child: ReusableContainerWidget(
        colour: kBackgroundCardColor,
        child: Column(
          children: [
            const TextTitle(title: 'AGE'),
            VerticalSpacing.small(),
            Text(
              '${bmiBrain.age}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 18,
            ),
            MinusPlusButtonsWidget(
              onMinusPressed: () {
                setState(() {
                  bmiBrain.modifyAge(isIncrease: false);
                });
              },
              onPlusPressed: () {
                setState(() {
                  bmiBrain.modifyAge(isIncrease: true);
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildWeightContainer() {
    return Expanded(
      child: ReusableContainerWidget(
          colour: kBackgroundCardColor,
          child: Column(
            children: [
              const TextTitle(title: 'WEIGHT'),
              VerticalSpacing.small(),
              Text(
                '${bmiBrain.weight}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 18,
              ),
              MinusPlusButtonsWidget(
                onMinusPressed: () {
                  setState(() {
                    bmiBrain.modifyWeight(isIncrease: false);
                  });
                },
                onPlusPressed: () {
                  setState(() {
                    bmiBrain.modifyWeight(isIncrease: true);
                  });
                },
              )
            ],
          )),
    );
  }

  Widget _buildHeightSection() {
    return ReusableContainerWidget(
      colour: kBackgroundCardColor,
      child: Column(
        children: [
          const TextTitle(title: 'HEIGHT'),
          VerticalSpacing.small(),
          _buildValueAndUnit(),
          _buildSlider()
        ],
      ),
    );
  }

  Slider _buildSlider() {
    return Slider(
      activeColor: Colors.white,
      thumbColor: kBackgroundButtonColor,
      inactiveColor: kInactiveColor,
      min: 100,
      max: 200,
      value: bmiBrain.heightcm.toDouble(),
      overlayColor: WidgetStateProperty.all(
        kBackgroundButtonColor.withOpacity(0.2),
      ),
      onChanged: (valueChange) {
        setState(() {
          bmiBrain.onChangeSlider(valueChange);
        });
      },
    );
  }

  Row _buildValueAndUnit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '${bmiBrain.heightcm}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          'cm',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.merge(TextStyle(color: kInactiveColor)),
        ),
      ],
    );
  }

  Row _buildGenderSelectionSection() {
    bool enableMale = (bmiBrain.currentGenderSelected == null ||
        bmiBrain.currentGenderSelected == Gender.male);
    bool enableFemale = (bmiBrain.currentGenderSelected == null ||
        bmiBrain.currentGenderSelected == Gender.female);
    return Row(
      children: [
        Expanded(
          child: ReusableButtonWidget(
            backgroundColor: const Color(0xff282b4e),
            enable: enableMale,
            onPress: () {
              setState(() {
                bmiBrain.modifyGender(Gender.male);
              });
            },
            child: const IconTextVertical(
              icons: Icons.male,
              text: 'MALE',
            ),
          ),
        ),
        const HorizontalSpacing(),
        Expanded(
          child: ReusableButtonWidget(
              backgroundColor: const Color(0xff282b4e),
              enable: enableFemale,
              child: const IconTextVertical(
                icons: Icons.female,
                text: 'FEMALE',
              ),
              onPress: () {
                setState(() {
                  bmiBrain.modifyGender(Gender.female);
                });
              }),
        ),
      ],
    );
  }
}
