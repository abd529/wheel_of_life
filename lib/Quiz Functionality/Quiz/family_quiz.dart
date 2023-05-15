// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:wheel_of_life/Screens/onboard_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';



class FamilyQuiz extends StatefulWidget {
  static const routeName = "my-fam-quiz";
  const FamilyQuiz({super.key});

  @override
  State<FamilyQuiz> createState() => _FamilyQuizState();
}

class _FamilyQuizState extends State<FamilyQuiz> {
  List<String> Questions = [
    "Q1: Do I feel satisfied with the ability I have to find and communicate with new friends or family?",
    "Q2: Am I satisfied with the relationship I have with my mother?",
    "Q3: Am I satisfied with the relationship I have with my father?",
    "Q4: Am I satisfied with the relationship I have with my children? If I don't have them and I love them, do I do actions to have them?",
    "Q5: How do I feel in my relationships with close relatives: brothers, grandparents, cousins, uncles, etc.?",
    "Q6: I feel satisfied with the friends I have, do I really have them when I need them and support me?",
    "Q7: Am I comfortable with the acquaintances I have?"
    "You are done",
    ];
  List<String> topic = ["Provision","Mother","Father","Children","Close Relatives","Friends","Known"];
  int index = 0;
  int _currentValue = 5;
  int ans1 = 0;
  int ans2 = 0;
  int ans3 = 0;
  int ans4 = 0;
  int ans5 = 0;
  int ans6 = 0;
  int ans7 = 0;
  int ans8 = 0;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                        child: 
                        SvgPicture.asset(
                                     "assets/logo.svg",
                                     width: 85,
                                     height: 85,
                                    ),
                      ),                    const SizedBox(width: 50,)
                  ]),
                  ),
                  const SizedBox(height:50),
                  Container(
                    color: Colors.purple.withOpacity(0.3),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Section", style: TextStyle(fontSize: 18),)],),
                  ),
                  const SizedBox(height: 10),
                  const Text("Family & Friends",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.purple.withOpacity(0.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Subject: ", style: TextStyle(fontSize: 18),),
                        index<=6? Text(topic[index], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),):const SizedBox(height: 20,)
                        ],),
                  ),
                  const SizedBox(height: 50,),
                  Align(
                  alignment: Alignment.center,
                  child: Text(Questions[index],textAlign: TextAlign.center ,style: const TextStyle(fontSize: 18),)),
                  const  SizedBox(height: 80,),
                index>5? const SizedBox(height: 20,): NumberPicker(
                  itemCount: 3,
                selectedTextStyle: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold, ),
                textStyle: const TextStyle(fontSize: 18,color: Colors.deepPurple),
                axis: Axis.horizontal,
                decoration: BoxDecoration(
                  border: Border.all(),
                  shape: BoxShape.circle,
                  color: Colors.purple.withOpacity(0.4)
                ),
                value:_currentValue,
                minValue: 1,
                maxValue: 10,
                onChanged: (value) { setState(()=> _currentValue = value);},),
                const SizedBox(height: 40,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                          shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(50)
                   ) ),
                  onPressed: (){
                  if(index<=7){
                    if(index==0){
                      setState(() {
                      ans1 = _currentValue;
                      print("the ans to Q1 is $ans1");
                      _currentValue = 5;
                      index++; 
                      });
                    }
                    else if(index==1){
                      setState(() {
                      ans2 = _currentValue;
                      print("the ans to Q2 is $ans2");
                      _currentValue = 5;
                      index++; 
                      });
                    }
                    else if(index==2){
                      setState(() {
                      ans3 = _currentValue;
                      print("the ans to Q3 is $ans3");
                      _currentValue = 5;
                      index++;
                        
                      }); 
                    }
                    else if(index==3){
                      setState(() {
                      ans4 = _currentValue;
                      print("the ans to Q4 is $ans4");
                      _currentValue = 5;
                      index++; 
                      });
                    }
                    else if(index==4){
                      setState(() {
                      ans5 = _currentValue;
                      print("the ans to Q5 is $ans5");
                      _currentValue = 5;
                      index++; 
                      });
                    }
                    else if(index==5){
                      setState(() {ans6 = _currentValue;
                      print("the ans to Q6 is $ans6");
                      _currentValue = 5;
                      index++;
                      });
                      }
                    else if(index==6){
                      setState(() {ans7 = _currentValue;
                      print("the ans to Q6 is $ans7");
                      _currentValue = 5;
                      index++;
                      });
                      }  
                  }
                  else{
                    //Store Data to Fire Store
                    FirebaseFirestore.instance
              .collection("User Answers") //folder
              .doc(userId).collection("Family").doc(userId).set({
            "Q1": ans1,
            "Q2": ans2,
            "Q3": ans3,
            "Q4": ans4,
            "Q5": ans5,
            "Q6": ans6,
            "Q7": ans7,
            "Average": (ans1+ans2+ans3+ans4+ans5+ans6+ans7)/7
          });
                    print("Data Stored and UserId is $userId");
                    Navigator.of(context).pushNamed(Onboard.routeName);
        
                  }
                }, child:  index<=5? const Text("Next"):const Text("Finish") ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  setState(() {
                    setState(() {
                    index++;
                    _currentValue = 5;                      
                    });
                  });
                }, style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                            shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(50)
                   ) ), child: const Text("Skip"),)
                
                ]),
          ),
        ),
      ),
    );
  }
}