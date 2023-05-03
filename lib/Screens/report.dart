// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wheel_of_life/Screens/wheel.dart';

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
  int _currentValue = 5;
  int baseQ1 = 0;
  int baseQ2 = 0;
  int baseQ3 = 0;
  int baseQ4 = 0;
  int baseQ5 = 0;
  int baseQ6 = 0;
  int baseQ7 = 0;
  int baseQ8 = 0;
  var adjustData = [];
  final userId = FirebaseAuth.instance.currentUser!.uid;
  void getInfo()async{
      var collection = FirebaseFirestore.instance.collection('User Answers');
      var docSnapshot = await collection.doc("$userId Base Line").get();
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
  }

  @override
  Widget build(BuildContext context) {
    var adjustData = [
  {"type": "BaseLine", "index": "Health", "value": baseQ1},
  {"type": "BaseLine", "index": "Personal Growth", "value": baseQ2},
  {"type": "BaseLine", "index": "Home", "value": baseQ3},
  {"type": "BaseLine", "index": "Family & Friends", "value": baseQ4},
  {"type": "BaseLine", "index": "Love", "value": baseQ5},
  {"type": "BaseLine", "index": "Free Time", "value": baseQ6},
  {"type": "BaseLine", "index": "Work", "value": baseQ7},
  {"type": "BaseLine", "index": "Money", "value": baseQ8},

  {"type": "Results", "index": "Health", "value": 0},
  {"type": "Results", "index": "Personal Growth", "value": 1},
  {"type": "Results", "index": "Home", "value": 2},
  {"type": "Results", "index": "Family & Friends", "value": 3},
  {"type": "Results", "index": "Love", "value": 4},
  {"type": "Results", "index": "Free Time", "value": 7},
  {"type": "Results", "index": "Work", "value": 6},
  {"type": "Results", "index": "Money", "value": 7},
];
    if (check == 0) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => getInfo());
          setState(() {
            
          });
      check++;
    }
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const PdfPreviewPage(),
            ),
          );
          // rootBundle.
        },
        child: const Icon(Icons.picture_as_pdf),
      ),
      appBar: AppBar(
        title: const Text("Report # 529"),
      ),
      body: ListView(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Column(
                children: [
                  const Text(
                    'Invoice Items',
                  ),
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
                  ElevatedButton(onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushAndRemoveUntil(
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

  const {"type": "Results", "index": "Health", "value": 0},
  const {"type": "Results", "index": "Personal Growth", "value": 1},
  const {"type": "Results", "index": "Home", "value": 2},
  const {"type": "Results", "index": "Family & Friends", "value": 3},
  const {"type": "Results", "index": "Love", "value": 4},
  const {"type": "Results", "index": "Free Time", "value": 7},
  const {"type": "Results", "index": "Work", "value": 6},
  const {"type": "Results", "index": "Money", "value": 7},
]),
                                  ),
                                  (Route<dynamic> route) => false);
                            }, child: Text("See Wheel of life"))
                ],
              ),
            ),
          ),
          Center(child: Text(baseQ1.toString())),
          Center(child: Text(baseQ8.toString())),
        ],
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