import 'package:bmi_calculator/bussines/bmi_brain.dart';
import 'package:bmi_calculator/constant/constant.dart';
import 'package:bmi_calculator/screen/resultScreen/result_screen.dart';
import 'package:flutter/material.dart';
import 'screen/InputScreen/input_screen.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Color(0xff12183a),
            foregroundColor: Colors.white,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          scaffoldBackgroundColor: kScaffoldBackgroundColor,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
                fontSize: 40,
                fontFamily: 'Lato',
                color: Colors.white,
                fontWeight: FontWeight.w900),
            bodyMedium: TextStyle(
              fontSize: 18,
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
            bodySmall: TextStyle(
              fontSize: 16,
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )),
      home: const InputScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/resultscreen':
            return MaterialPageRoute(
                builder: (context) =>
                    ResultScreen(args: settings.arguments as BMIBrain));
        }
        return null;
      },
    );
  }
}
