import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:wheel_of_life/Screens/onboard_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wheel_of_life/Screens/report.dart';



class MoneyQuiz extends StatefulWidget {
  static const routeName = "my-money-quiz";
  const MoneyQuiz({super.key});

  @override
  State<MoneyQuiz> createState() => _MoneyQuizState();
}

class _MoneyQuizState extends State<MoneyQuiz> {
  List<String> Questions = [
    "Q1: How do I feel about the belongings I have? Can I satisfy everything I have?",
    "Q2: Do I have guarantees that support me financially and I feel sufficient guarantees?",
    "Q3: Am I satisfied with the income I have today and are enough to have the standard of living?",
    "Q4: Am I satisfied with the income I will have in the future, and my perspective of economic growth is promising?",
    "Q5: How do I feel about the level of expenses I have. Expenditure above my possibilities?",
    "Q6: Do I anticipate many expenses in the future and I feel that I will not be able to cover my future accounts?",
    "Q7: Am I satisfied with the level of debts I have? Or do I feel very overwhelmed with economic commitments?",
    "Q8: I keep some money for bad times, and I'm happy with my savings?",
    "Money questions are completed ",
    ];
  List<String> topic = ["Belongings","Guarantees","Income","Future income","Bills","Future expenses","Debts","Saving"];
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
                  const Text("Money",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.purple.withOpacity(0.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Subject: ", style: TextStyle(fontSize: 18),),
                        index<=7? Text(topic[index], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),):const SizedBox(height: 20,)
                        ],),
                  ),
                  const SizedBox(height: 50,),
                  Align(
                  alignment: Alignment.center,
                  child: Text(Questions[index],textAlign: TextAlign.center ,style: const TextStyle(fontSize: 18),)),
                  const  SizedBox(height: 80,),
                index>7? const SizedBox(height: 20,): NumberPicker(
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
                Row(
                  mainAxisAlignment: index <=7 ? MainAxisAlignment.spaceAround : MainAxisAlignment.center,
                  children: [
                    index<=7? ElevatedButton(onPressed: (){
                      setState(() {
                        index--;
                      });
                    }, 
                    style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                              shape: RoundedRectangleBorder( 
                          borderRadius: BorderRadius.circular(50)
                       ) ),
                    child: const Text("Previous")):const SizedBox(height: 10,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
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
                          setState(() {
                          ans7 = _currentValue;
                          print("the ans to Q7 is $ans7");
                          _currentValue = 5;
                          index++; 
                          });
                        }
                        else if(index==7){
                          setState(() {
                          ans8 = _currentValue;
                          print("the ans to Q8 is $ans8");
                          _currentValue = 5;
                          index++; 
                          });
                        }
                      }
                      else{
                        FirebaseFirestore.instance
              .collection("User Answers")
              .doc(userId).collection("Money").doc(userId).set({
            "Q1": ans1,
            "Q2": ans2,
            "Q3": ans3,
            "Q4": ans4,
            "Q5": ans5,
            "Q6": ans6,
            "Q7": ans7,
            "Q8": ans8,
            "Average": (ans1+ans2+ans3+ans4+ans5+ans6+ans7+ans8)/8
          });
                        print("Data Stored and UserId is $userId");
                        Navigator.of(context).pushNamed(DetailPage.routeName);
        
                      }
                    }, child:  index<=7? const Text("Next"):const Text("Move to next section") ),
                  ],
                ),
                const SizedBox(height: 20,),
                index<=7?ElevatedButton(onPressed: (){
                  setState(() {
                    setState(() {
                    index++;
                    _currentValue = 5;                      
                    });
                  });
                }, style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.withOpacity(0.3),
                          padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                            shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(50)
                   ) ), child: const Text("Skip", style: TextStyle(color: Colors.black),),)
                : const SizedBox(height: 20,)
                
                ]),
          ),
        ),
      ),
    );
  }
}