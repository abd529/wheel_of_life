// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:wheel_of_life/Screens/report.dart';
import 'package:flutter_svg/flutter_svg.dart';



class Quiz extends StatefulWidget {
  static const routeName = "my-quiz";
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> Questions = [
    "Q1: How do you feel you are in this area ?",
    "Q2: How do you feel you are in this area ?",
    "Q3: How do you feel you are in this area ?",
    "Q4: How do you feel you are in this area ?",
    "Q5: How do you feel you are in this area ?",
    "Q6: How do you feel you are in this area ?",
    "Q7: How do you feel you are in this area ?",
    "Q8: How do you feel you are in this area ?",
    "You are done",
    "You are done 2",
    ];
  List<String> Topic = ["Health","Personal Growth","Home","Family & Friends","Love","Free Time", "Work", "Money"];
  List<String> images = ["assets/Home.svg"];
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
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const BackButton(),
                   Center(
                      child: SvgPicture.asset(
                                   "assets/logo.svg",
                                   width: 85,
                                   height: 85,
                                  ),
                    ),
                    const SizedBox(width: 50,)
                ]),
                ),
                SizedBox(height:50),
                Text(Topic[index], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Align(
                alignment: Alignment.center,
                child: Text(Questions[index],textAlign: TextAlign.center ,style: TextStyle(fontSize: 18),)),
                SvgPicture.asset(images[index]),
              index>7? const SizedBox(height: 20,): NumberPicker(
              value:_currentValue,
              minValue: 1,
              maxValue: 10,
              onChanged: (value) { setState(()=> _currentValue = value);},),
              ElevatedButton(onPressed: (){
                if(index<=7){
                  if(index==0){
                    setState(() {
                    BaseAns1 = _currentValue;
                    print("the ans to Q1 is $BaseAns1");
                    _currentValue = 5;
                    index++; 
                    });
                  }
                  else if(index==1){
                    setState(() {
                    BaseAns2 = _currentValue;
                    print("the ans to Q2 is $BaseAns2");
                    _currentValue = 5;
                    index++; 
                    });
                  }
                  else if(index==2){
                    setState(() {
                    BaseAns3 = _currentValue;
                    print("the ans to Q3 is $BaseAns3");
                    _currentValue = 5;
                    index++;
                      
                    }); 
                  }
                  else if(index==3){
                    setState(() {
                    BaseAns4 = _currentValue;
                    print("the ans to Q4 is $BaseAns4");
                    _currentValue = 5;
                    index++; 
                    });
                  }
                  else if(index==4){
                    setState(() {
                    BaseAns5 = _currentValue;
                    print("the ans to Q5 is $BaseAns5");
                    _currentValue = 5;
                    index++; 
                    });
                  }
                  else if(index==5){
                    setState(() {BaseAns6 = _currentValue;
                    print("the ans to Q6 is $BaseAns6");
                    _currentValue = 5;
                    index++;
                    });
                    }
                  else if(index==6){
                    setState(() {
                    BaseAns7 = _currentValue;
                    print("the ans to Q7 is $BaseAns7");
                    _currentValue = 5;
                    index++; 
                    });
                  }
                  else if(index==7){
                    setState(() {
                    BaseAns8 = _currentValue;
                    print("the ans to Q8 is $BaseAns8");
                    _currentValue = 5;
                    index++; 
                    });
                  }
                }
                else{
                  //Store Data to Fire Store
                  FirebaseFirestore.instance
            .collection("User Answers") //folder
            .doc("$userId Base Line").set({
          "Q1": BaseAns1,
          "Q2": BaseAns2,
          "Q3": BaseAns3,
          "Q4": BaseAns4,
          "Q5": BaseAns5,
          "Q6": BaseAns6,
          "Q7": BaseAns7,
          "Q8": BaseAns8,
        });
                  print("Data Stored and UserId is $userId");
                  Navigator.of(context).pushNamed(DetailPage.routeName);
      
                }
              }, child:  index<=7? Text("Next"):Text("Finish") )
              
              ]),
        ),
      ),
    );
  }
}