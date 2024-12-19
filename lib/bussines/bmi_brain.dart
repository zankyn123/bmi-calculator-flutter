import 'dart:math';

import 'package:flutter/foundation.dart';

enum Gender { male, female }

enum CategoriesBMI {
  underweightSevere, // Thiếu cân nghiêm trọng
  underweightModerate, // Thiếu cân vừa phải
  underweightMild, // Thiếu cân nhẹ
  normalRange, // Cân đối
  overweightPre, // Thừa cân - Tiền béo phí
  obeseClassFirst, // Béo phì loại 1
  obeseClassSecond, // Béo phì loại 2
  obeseClassThird, // Béo phí loại 3
}

class BMIBrain {
  Gender? _currentGenderSelected;
  int _heightcm = 160;
  int _age = 18;
  double _weight = 50;
  double? _bmiCalculated;

  // Private methods
  double _cmToM(int cm) {
    return cm / 100;
  }

  // Get properties
  int get heightcm => _heightcm;
  int get age => _age;
  double get weight => _weight;
  Gender? get currentGenderSelected => _currentGenderSelected;
  String get bmiCaculatedDisplay => _bmiCalculated?.toStringAsFixed(1) ?? '';
  String get bmiCategoryDisplay {
    switch (getCategory()) {
      case CategoriesBMI.underweightSevere ||
            CategoriesBMI.underweightModerate ||
            CategoriesBMI.underweightMild:
        return 'Underweight';
      case CategoriesBMI.normalRange:
        return 'Normal';
      case CategoriesBMI.overweightPre:
        return 'Overweight';
      case (CategoriesBMI.obeseClassFirst ||
            CategoriesBMI.obeseClassSecond ||
            CategoriesBMI.obeseClassThird):
        return 'Obese';
      case null:
        return '';
    }
  }

  String get bmiAdviceDisplay {
    switch (getCategory()) {
      case CategoriesBMI.underweightSevere ||
            CategoriesBMI.underweightModerate ||
            CategoriesBMI.underweightMild:
        return 'Bạn hơi gầy, ăn uống mạnh vào nhá !!';
      case CategoriesBMI.normalRange:
        return 'Cơ thể cân đối, chúc mừng bạn, hãy duy trì nhé 😎';
      case CategoriesBMI.overweightPre:
        return 'Sắp có dấu hiệu béo rồi đấy, bạn hãy tăng cường tập thể dục lên';
      case (CategoriesBMI.obeseClassFirst ||
            CategoriesBMI.obeseClassSecond ||
            CategoriesBMI.obeseClassThird):
        return 'Béo lắm rồi, giảm cân mauuuu !!!';
      case null:
        return '';
    }
  }

  // Public methods
  void onChangeSlider(double valueChange) {
    _heightcm = valueChange.toInt();
  }

  void modifyGender(Gender sexSelected) {
    _currentGenderSelected = sexSelected;
  }

  void modifyAge({required bool isIncrease}) {
    _age = isIncrease ? (_age + 1) : (_age - 1);
  }

  void modifyWeight({required bool isIncrease}) {
    _weight = isIncrease ? (_weight + 0.5) : (_weight - 0.5);
  }

  void calculateBMI() {
    _bmiCalculated = (_weight / (pow(_cmToM(_heightcm), 2)));
    if (kDebugMode) {
      print(_bmiCalculated);
    }
  }

  CategoriesBMI? getCategory() {
    if (_bmiCalculated != null) {
      if (_bmiCalculated! < 16) {
        return CategoriesBMI.underweightSevere;
      } else if (_bmiCalculated! >= 16 && _bmiCalculated! <= 16.9) {
        return CategoriesBMI.underweightModerate;
      } else if (_bmiCalculated! >= 17 && _bmiCalculated! <= 18.4) {
        return CategoriesBMI.underweightMild;
      } else if (_bmiCalculated! >= 18.5 && _bmiCalculated! <= 24.9) {
        return CategoriesBMI.normalRange;
      } else if (_bmiCalculated! >= 25.0 && _bmiCalculated! <= 29.9) {
        return CategoriesBMI.overweightPre;
      } else if (_bmiCalculated! >= 30.0 && _bmiCalculated! <= 34.9) {
        return CategoriesBMI.obeseClassFirst;
      } else if (_bmiCalculated! >= 35.0 && _bmiCalculated! <= 39.9) {
        return CategoriesBMI.obeseClassSecond;
      } else {
        return CategoriesBMI.obeseClassThird;
      }
    } else {
      return null;
    }
  }
}
