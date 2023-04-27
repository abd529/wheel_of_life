import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  String email = "";
  String fName = "";
  String lName = "";
  int num = 0;
  getInfo() async{
      var collection = FirebaseFirestore.instance.collection('UsersData');
      var docSnapshot = await collection.doc("abd3@gmail.com").get();
      if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      setState(() {
        email = data?["Email"];
        fName = data?["First Name"];
        lName = data?["Last Name"];
      });
      }
  }

  @override
  Widget build(BuildContext context) {
     if (num == 0) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => getInfo());
      num++;
    }
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          //const Text("Onboarding Screen"),
          Text(email),
          Text(fName),
          Text(lName)
        ],
      ),),
    );
  }
}