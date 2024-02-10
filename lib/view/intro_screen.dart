import 'package:flutter/material.dart';
import 'package:quiz_apk/utils/color_constant/color_constant.dart';
import 'package:quiz_apk/view/quiz_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.mainBlack,
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizScreen(),
              )),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "Start Quiz",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
