// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wheel_of_life/Screens/pdf_screen.dart';
import 'package:wheel_of_life/Screens/wheel.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DetailPage extends StatefulWidget {
  static const routeName = "report-page";
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int check = 0;
  int baseQ1 = 0;
  int baseQ2 = 0;
  int baseQ3 = 0;
  int baseQ4 = 0;
  int baseQ5 = 0;
  int baseQ6 = 0;
  int baseQ7 = 0;
  int baseQ8 = 0;

  int healthQ1 = 0;
  int healthQ2 = 0;
  int healthQ3 = 0;
  int healthQ4 = 0;
  int healthQ5 = 0;
  int healthQ6 = 0;
  double healthAvg = 0;

  int personalQ1 = 0;
  int personalQ2 = 0;
  int personalQ3 = 0;
  int personalQ4 = 0;
  int personalQ5 = 0;
  int personalQ6 = 0;
  int personalQ7 = 0;
  int personalQ8 = 0;
  double personalAvg = 0;

  int homeQ1 = 0;
  int homeQ2 = 0;
  int homeQ3 = 0;
  int homeQ4 = 0;
  int homeQ5 = 0;
  int homeQ6 = 0;
  double homeAvg = 0;

  int famQ1 = 0;
  int famQ2 = 0;
  int famQ3 = 0;
  int famQ4 = 0;
  int famQ5 = 0;
  int famQ6 = 0;
  int famQ7 = 0;
  double famAvg = 0;

  int loveQ1 = 0;
  int loveQ2 = 0;
  int loveQ3 = 0;
  int loveQ4 = 0;
  int loveQ5 = 0;
  int loveQ6 = 0;
  int loveQ7 = 0;
  int loveQ8 = 0;
  double loveAvg = 0;

  int freeQ1 = 0;
  int freeQ2 = 0;
  int freeQ3 = 0;
  int freeQ4 = 0;
  int freeQ5 = 0;
  int freeQ6 = 0;
  double freeAvg = 0;

  int workQ1 = 0;
  int workQ2 = 0;
  int workQ3 = 0;
  int workQ4 = 0;
  int workQ5 = 0;
  int workQ6 = 0;
  int workQ7 = 0;
  int workQ8 = 0;
  double workAvg = 0;

  int moneyQ1 = 0;
  int moneyQ2 = 0;
  int moneyQ3 = 0;
  int moneyQ4 = 0;
  int moneyQ5 = 0;
  int moneyQ6 = 0;
  int moneyQ7 = 0;
  int moneyQ8 = 0;
  double moneyAvg = 0;


  var adjustData = [];
  final userId = FirebaseAuth.instance.currentUser!.uid;
  void getInfo()async{
      var collection = FirebaseFirestore.instance.collection('User Answers');
      var docSnapshot = await collection.doc(userId).collection("Base Line").doc(userId).get();
      if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      setState(() {
        baseQ1 = data?["Q1"];
        baseQ2 = data?["Q2"];
        baseQ3 = data?["Q3"];
        baseQ4 = data?["Q4"];
        baseQ5 = data?["Q5"];
        baseQ6 = data?["Q6"];
        baseQ7 = data?["Q7"];
        baseQ8 = data?["Q8"];
      });
      }
      var docSnapshot2 = await collection.doc(userId).collection("Health").doc(userId).get();
      if (docSnapshot2.exists){
       Map<String, dynamic>? data = docSnapshot2.data();
      setState(() {
        healthQ1 = data?["Q1"];
        healthQ2 = data?["Q2"];
        healthQ3 = data?["Q3"];
        healthQ4 = data?["Q4"];
        healthQ5 = data?["Q5"];
        healthQ6 = data?["Q6"];
        healthAvg = data?["Average"];
      });
      }
      var docSnapshot3 = await collection.doc(userId).collection("Personal Growth").doc(userId).get();
      if (docSnapshot3.exists){
       Map<String, dynamic>? data = docSnapshot3.data();
      setState(() {
        personalQ1 = data?["Q1"];
        personalQ2 = data?["Q2"];
        personalQ3 = data?["Q3"];
        personalQ4 = data?["Q4"];
        personalQ5 = data?["Q5"];
        personalQ6 = data?["Q6"];
        personalQ7 = data?["Q7"];
        personalQ8 = data?["Q8"];
        personalAvg = data?["Average"];
      });
      }
      var docSnapshot4 = await collection.doc(userId).collection("Home").doc(userId).get();
      if (docSnapshot4.exists){
       Map<String, dynamic>? data = docSnapshot4.data();
      setState(() {
        homeQ1 = data?["Q1"];
        homeQ2 = data?["Q2"];
        homeQ3 = data?["Q3"];
        homeQ4 = data?["Q4"];
        homeQ5 = data?["Q5"];
        homeQ6 = data?["Q6"];
        homeAvg = data?["Average"];
      });
      }
      var docSnapshot5 = await collection.doc(userId).collection("Family").doc(userId).get();
      if (docSnapshot5.exists){
       Map<String, dynamic>? data = docSnapshot5.data();
      setState(() {
        famQ1 = data?["Q1"];
        famQ2 = data?["Q2"];
        famQ3 = data?["Q3"];
        famQ4 = data?["Q4"];
        famQ5 = data?["Q5"];
        famQ6 = data?["Q6"];
        famQ7 = data?["Q7"];
        famAvg = data?["Average"];
      });
      }
      var docSnapshot6 = await collection.doc(userId).collection("Love").doc(userId).get();
      if (docSnapshot6.exists){
       Map<String, dynamic>? data = docSnapshot6.data();
      setState(() {
        loveQ1 = data?["Q1"];
        loveQ2 = data?["Q2"];
        loveQ3 = data?["Q3"];
        loveQ4 = data?["Q4"];
        loveQ5 = data?["Q5"];
        loveQ6 = data?["Q6"];
        loveQ7 = data?["Q7"];
        loveQ8 = data?["Q8"];
        loveAvg = data?["Average"];
      });
      }
      var docSnapshot7 = await collection.doc(userId).collection("Free Time").doc(userId).get();
      if (docSnapshot7.exists){
       Map<String, dynamic>? data = docSnapshot7.data();
      setState(() {
        freeQ1 = data?["Q1"];
        freeQ2 = data?["Q2"];
        freeQ3 = data?["Q3"];
        freeQ4 = data?["Q4"];
        freeQ5 = data?["Q5"];
        freeQ6 = data?["Q6"];
        freeAvg = data?["Average"];
      });
      }
      var docSnapshot8 = await collection.doc(userId).collection("Work").doc(userId).get();
      if (docSnapshot8.exists){
       Map<String, dynamic>? data = docSnapshot8.data();
      setState(() {
        workQ1 = data?["Q1"];
        workQ2 = data?["Q2"];
        workQ3 = data?["Q3"];
        workQ4 = data?["Q4"];
        workQ5 = data?["Q5"];
        workQ6 = data?["Q6"];
        workQ7 = data?["Q7"];
        workQ8 = data?["Q8"];
        workAvg = data?["Average"];
      });
      }
      var docSnapshot9 = await collection.doc(userId).collection("Money").doc(userId).get();
      if (docSnapshot9.exists){
       Map<String, dynamic>? data = docSnapshot9.data();
      setState(() {
        moneyQ1 = data?["Q1"];
        moneyQ2 = data?["Q2"];
        moneyQ3 = data?["Q3"];
        moneyQ4 = data?["Q4"];
        moneyQ5 = data?["Q5"];
        moneyQ6 = data?["Q6"];
        moneyQ7 = data?["Q7"];
        moneyQ8 = data?["Q8"];
        moneyAvg = data?["Average"];
      });
      }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (check == 0) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => getInfo());
      check++;
    }
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PDFScreen(),
            ),
          );
          // rootBundle.
        },
        child: const Icon(Icons.picture_as_pdf),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
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
                  SizedBox(width: size.width/6,)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: Column(
                    children: [
                      const Text(
                        'Baseline Question Answers',
                      ),
                      const SizedBox(height: 10,),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q1"),
                             Text(
                              baseQ1.toString(),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q2"),
                             Text(
                              baseQ2.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q3"),
                             Text(
                              baseQ3.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q4"),
                             Text(
                              baseQ4.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q5"),
                             Text(
                              baseQ5.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q7"),
                             Text(
                              baseQ7.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q8"),
                             Text(
                              baseQ8.toString(),
                            ),
                          ],
                        )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: Column(
                    children: [
                      const Text(
                        'Health Question Answers',
                      ),
                      const SizedBox(height: 10,),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q1"),
                             Text(
                              healthQ1.toString(),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q2"),
                             Text(
                              healthQ2.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q3"),
                             Text(
                              healthQ3.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q4"),
                             Text(
                              healthQ4.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q5"),
                             Text(
                              healthQ5.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q6"),
                             Text(
                              healthQ6.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Average"),
                             Text(
                              healthAvg.toString(),
                            ),
                          ],
                        )),
                       
                    ],
                  ),
                ),
                ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: Column(
                    children: [
                      const Text(
                        'Personal Growth Question Answers',
                      ),
                      const SizedBox(height: 10,),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q1"),
                             Text(
                              personalQ1.toString(),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q2"),
                             Text(
                              personalQ2.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q3"),
                             Text(
                              personalQ3.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q4"),
                             Text(
                              personalQ4.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q5"),
                             Text(
                              personalQ5.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q6"),
                             Text(
                              personalQ6.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q7"),
                             Text(
                              personalQ7.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q8"),
                             Text(
                              personalQ8.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Average"),
                             Text(
                              personalAvg.toString(),
                            ),
                          ],
                        )),
                       
                    ],
                  ),
                ),
                ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: Column(
                    children: [
                      const Text(
                        'Home Question Answers',
                      ),
                      const SizedBox(height: 10,),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q1"),
                             Text(
                              homeQ1.toString(),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q2"),
                             Text(
                              homeQ2.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q3"),
                             Text(
                              homeQ3.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q4"),
                             Text(
                              homeQ4.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q5"),
                             Text(
                              homeQ5.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q6"),
                             Text(
                              homeQ6.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Average"),
                             Text(
                              homeAvg.toString(),
                            ),
                          ],
                        )),
                       
                    ],
                  ),
                ),
                ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: Column(
                    children: [
                      const Text(
                        'Family & Friends Question Answers',
                      ),
                      const SizedBox(height: 10,),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q1"),
                             Text(
                              famQ1.toString(),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q2"),
                             Text(
                              famQ2.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q3"),
                             Text(
                              famQ3.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q4"),
                             Text(
                              famQ4.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q5"),
                             Text(
                              famQ5.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q6"),
                             Text(
                              famQ6.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q7"),
                             Text(
                              famQ7.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Average"),
                             Text(
                              famAvg.toString(),
                            ),
                          ],
                        )),
                       
                    ],
                  ),
                ),
                ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: Column(
                    children: [
                      const Text(
                        'Love Question Answers',
                      ),
                      const SizedBox(height: 10,),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q1"),
                             Text(
                              loveQ1.toString(),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q2"),
                             Text(
                              loveQ2.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q3"),
                             Text(
                              loveQ3.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q4"),
                             Text(
                              loveQ4.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q5"),
                             Text(
                              loveQ5.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q6"),
                             Text(
                              loveQ6.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q7"),
                             Text(
                              loveQ7.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q8"),
                             Text(
                              loveQ8.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Average"),
                             Text(
                              loveAvg.toString(),
                            ),
                          ],
                        )),
                       
                    ],
                  ),
                ),
                ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: Column(
                    children: [
                      const Text(
                        'Free Time Question Answers',
                      ),
                      const SizedBox(height: 10,),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q1"),
                             Text(
                              freeQ1.toString(),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q2"),
                             Text(
                              freeQ2.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q3"),
                             Text(
                              freeQ3.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q4"),
                             Text(
                              freeQ4.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q5"),
                             Text(
                              freeQ5.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q6"),
                             Text(
                              freeQ6.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Average"),
                             Text(
                              freeAvg.toString(),
                            ),
                          ],
                        )),
                       
                    ],
                  ),
                ),
                ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: Column(
                    children: [
                      const Text(
                        'Work Question Answers',
                      ),
                      const SizedBox(height: 10,),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q1"),
                             Text(
                              workQ1.toString(),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q2"),
                             Text(
                              workQ2.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q3"),
                             Text(
                              workQ3.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q4"),
                             Text(
                              workQ4.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q5"),
                             Text(
                              workQ5.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q6"),
                             Text(
                              workQ6.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q7"),
                             Text(
                              workQ7.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q8"),
                             Text(
                              workQ8.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Average"),
                             Text(
                              workAvg.toString(),
                            ),
                          ],
                        )),
                       
                    ],
                  ),
                ),
                ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: Column(
                    children: [
                      const Text(
                        'Money Question Answers',
                      ),
                      const SizedBox(height: 10,),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q1"),
                             Text(
                              moneyQ1.toString(),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q2"),
                             Text(
                              moneyQ2.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q3"),
                             Text(
                              moneyQ3.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q4"),
                             Text(
                              moneyQ4.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q5"),
                             Text(
                              moneyQ5.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q6"),
                             Text(
                              moneyQ6.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q7"),
                             Text(
                              moneyQ7.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Q8"),
                             Text(
                              moneyQ8.toString(),
                            ),
                          ],
                        )),
                        DefaultTextStyle.merge(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             const Text("Average"),
                             Text(
                              moneyAvg.toString(),
                            ),
                          ],
                        )),
                       
                    ],
                  ),
                ),
                ),
              ElevatedButton(onPressed: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => WheelOfLife(adjustData: [
          {"type": "BaseLine", "index": "Health", "value": baseQ1},
          {"type": "BaseLine", "index": "Personal Growth", "value": baseQ2},
          {"type": "BaseLine", "index": "Home", "value": baseQ3},
          {"type": "BaseLine", "index": "Family & Friends", "value": baseQ4},
          {"type": "BaseLine", "index": "Love", "value": baseQ5},
          {"type": "BaseLine", "index": "Free Time", "value": baseQ6},
          {"type": "BaseLine", "index": "Work", "value": baseQ7},
          {"type": "BaseLine", "index": "Money", "value": baseQ8},
              
          {"type": "Results", "index": "Health", "value": healthAvg.toInt()},
          {"type": "Results", "index": "Personal Growth", "value": personalAvg.toInt()},
          {"type": "Results", "index": "Home", "value": homeAvg.toInt()},
          {"type": "Results", "index": "Family & Friends", "value": famAvg.toInt()},
          {"type": "Results", "index": "Love", "value": loveAvg.toInt()},
          {"type": "Results", "index": "Free Time", "value": freeAvg.toInt()},
          {"type": "Results", "index": "Work", "value": workAvg.toInt()},
          {"type": "Results", "index": "Money", "value": moneyAvg.toInt()},
              ]),
                                      ));
                                }, child: const Text("See Wheel of life"))             
             ],
          ),
        ),
      ),
    );
  }
}

class PdfPreviewPage extends StatelessWidget {
  const PdfPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
    );
  }
}