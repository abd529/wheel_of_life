// ignore_for_file: camel_case_types, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';
import 'lastbutton.dart';
import 'package:numberpicker/numberpicker.dart';


class quizDesign extends StatefulWidget {
  final List<Map<String, Object>> questions;
  var questionIndex;
  final Function answerQuestion;

  quizDesign({
    super.key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  State<quizDesign> createState() => _quizDesignState();
}

class _quizDesignState extends State<quizDesign> {
  int _currentValue = 5;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Question(
            widget.questions[widget.questionIndex]['questionText1'] as String,
            widget.questions[widget.questionIndex]['questionText2'] as String,
            widget.questions[widget.questionIndex]['questionText3'] as String,
          ),
          ...(widget.questions[widget.questionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return Answer(() => widget.answerQuestion(answer['score']),
                answer['text'] as String);
          }).toList(),
          ...(widget.questions[widget.questionIndex]['lastbutton']
                  as List<Map<String, Object>>)
              .map((answer) {
            return lastButton(() => widget.answerQuestion(answer['score']),
                answer['textn'] as String);
          }).toList(),
          NumberPicker(
          value:_currentValue,
          minValue: 0,
          maxValue: 10,
          onChanged: (value) => setState(()=> _currentValue = value),)
        ],
      ),
    );
  }
}
