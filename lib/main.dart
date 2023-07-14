import 'package:flutter/material.dart';
import 'package:multiquiz/quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'multi_quistions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  QuizBrain quizBrain = QuizBrain();
  bool isChooseAnswer = false;
  Color color_answer1 = Colors.black;
  Color color_answer2 = Colors.black;
  Color color_answer3 = Colors.black;
  String nextText = "Next";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "multi questions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.black,
          ),
          body: Column(
            children: [
              Expanded(
                child: Center(
                    child: Text(
                  quizBrain.getQuestion(),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                )),
              ),
              Container(
                height: 56,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: color_answer2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => color_answer1)),
                  onPressed: isChooseAnswer
                      ? null
                      : () {
                          if (quizBrain.getCorrectAnswer() ==
                              quizBrain.getAnswer1()) {
                            color_answer1 = Colors.green;
                            quizBrain.calculateScore();
                          } else {
                            color_answer1 = Colors.red;
                          }
                          setState(() {
                            isChooseAnswer = true;
                          });
                        },
                  child: Center(
                    child: Text(quizBrain.getAnswer1(),
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Container(
                height: 56,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: color_answer2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => color_answer2)),
                  onPressed: isChooseAnswer
                      ? null
                      : () {
                          if (quizBrain.getCorrectAnswer() ==
                              quizBrain.getAnswer2()) {
                            color_answer2 = Colors.green;
                            quizBrain.calculateScore();
                          } else {
                            color_answer2 = Colors.red;
                          }
                          setState(() {
                            isChooseAnswer = true;
                          });
                        },
                  child: Center(
                    child: Text(quizBrain.getAnswer2(),
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Container(
                height: 56,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => color_answer3)),
                  onPressed: isChooseAnswer
                      ? null
                      : () {
                          if (quizBrain.getCorrectAnswer() ==
                              quizBrain.getAnswer3()) {
                            color_answer3 = Colors.green;
                            quizBrain.calculateScore();
                          } else {
                            color_answer3 = Colors.red;
                          }
                          setState(() {
                            isChooseAnswer = true;
                          });
                        },
                  child: Center(
                    child: Text(quizBrain.getAnswer3(),
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          color_answer1 = Colors.black;
                          color_answer2 = Colors.black;
                          color_answer3 = Colors.black;
                          isChooseAnswer = false;
                          if (quizBrain.isFinished()) {
                            Alert(
                                context: context,
                                title: "Result",
                                desc: "${quizBrain.getScore()}/3",
                                buttons: [
                                  DialogButton(
                                      child: const Text(
                                        "Done",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () {
                                        nextText = "Next";
                                        quizBrain.reset();
                                        Navigator.pop(context);
                                        setState(() {});
                                      })
                                ]).show();
                          } else {
                            quizBrain.nextQuestion();
                            if (quizBrain.isLastQuestion()) {
                              nextText = "Next";
                            }
                          }
                        });
                      },
                      child: Text(nextText,
                          style: const TextStyle(color: Colors.blue)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ));
  }
}
