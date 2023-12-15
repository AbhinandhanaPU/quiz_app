import 'package:flutter/material.dart';
import 'package:quiz_apk/utils/color_constant/color_constant.dart';
import 'package:quiz_apk/utils/databse/db.dart';
import 'package:quiz_apk/view/score_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int correctAnwser = 0;
  int wrongAnwser = 0;
  int value = 0;
  int? checkValue;
  void counter() {
    value = value + 1;
    setState(() {});
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.mainBlack,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Questions",
                  style:
                      TextStyle(fontSize: 22, color: ColorConstant.appBarGrey),
                ),
                Text(
                  "${value + 1}/${DataBase.quizList.length}",
                  style:
                      TextStyle(fontSize: 20, color: ColorConstant.appBarGrey),
                ),
              ]),
              SizedBox(height: 25),
              Text(
                DataBase.quizList[value]["questions"],
                style: TextStyle(fontSize: 21, color: ColorConstant.mainWhite),
              ),
              SizedBox(height: 40),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    checkValue = index;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: checkValue == index
                            ? DataBase.quizList[value]["answer"] == checkValue
                                ? Colors.green
                                : Colors.red
                            : const Color.fromARGB(0, 255, 193, 7),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ColorConstant.lightWhite)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        DataBase.quizList[value]["option"][index],
                        style: TextStyle(
                            fontSize: 20, color: ColorConstant.mainWhite),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  if (DataBase.quizList[value]["answer"] == checkValue) {
                    correctAnwser++;
                  } else {
                    wrongAnwser++;
                  }
                  if (value == DataBase.quizList.length - 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScoreScreen(
                              correctTotal: correctAnwser,
                              wrongTotal: wrongAnwser),
                        ));
                  }
                  counter();
                  checkValue = 5;
                  setState(() {});
                },
                child: Container(
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "NEXT",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
