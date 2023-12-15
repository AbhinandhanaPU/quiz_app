import 'package:flutter/material.dart';
import 'package:quiz_apk/utils/color_constant/color_constant.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({
    super.key,
    required this.correctTotal,
    required this.wrongTotal,
  });
  final int correctTotal;
  final int wrongTotal;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.mainBlack,
        body: Column(children: [
          SizedBox(height: 100),
          Text(
            "SCORE",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: ColorConstant.mainWhite,
            ),
          ),
          SizedBox(height: 40),
          Text(
            "$correctTotal",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: ColorConstant.mainWhite,
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Correct Anwers :",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              Text(
                "$correctTotal",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              )
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Wrong Anwers :",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "$wrongTotal",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              )
            ],
          )
        ]),
      ),
    );
  }
}
