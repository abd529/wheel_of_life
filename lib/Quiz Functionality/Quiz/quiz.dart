// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> Questions = ["Q1","Q2","Q3"];
  int index = 0;
  int _currentValue = 5;
  int BaseAns1 = 0;
  int BaseAns2 = 0;
  int BaseAns3 = 0;
  int BaseAns4 = 0;
  int BaseAns5 = 0;
  int BaseAns6 = 0;
  int BaseAns7 = 0;
  int BaseAns8 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(Questions[index]),
             NumberPicker(
            value:_currentValue,
            minValue: 1,
            maxValue: 10,
            onChanged: (value) { setState(()=> _currentValue = value);},),
            ElevatedButton(onPressed: (){
              if (index<=2)
              {
                setState(() {
                 if(index==0){
              BaseAns1 = _currentValue;
              
              }
              if(index<3){index++; 
              _currentValue = 1;}
              });}
            }, child:  index>=2? Text("finish"):Text("next") )
            
            ]),
      ),
    );
  }
}