
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:wheel_of_life/Authentication/login_screen.dart';
import 'package:wheel_of_life/Screens/email.dart';
import 'package:wheel_of_life/Screens/report.dart';
import 'package:wheel_of_life/Screens/stripe_payment.dart';
import 'package:wheel_of_life/Screens/youtube_screen.dart';

import '../Quiz Functionality/Quiz/quiz.dart';
import '../main.dart';


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
  final userId = FirebaseAuth.instance.currentUser!.uid;
  

  getInfo() async{
      var collection = FirebaseFirestore.instance.collection('UsersData');
      var docSnapshot = await collection.doc(userId).get();
      if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      setState(() {
        email = data?["Email"];
        fName = data?["First Name"];
        lName = data?["Last Name"];
      });
      }
  }

  changeLocale(value){
   MyApp.setLocale(context,Locale(value));
  }
  
  @override
  Widget build(BuildContext context) {
     if (num == 0) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => getInfo());
      num++;
    }
    String lang =  Localizations.localeOf(context).toString();
    print(lang);
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          Row(
            children: [
              const Text("Espanol"),
              Radio(value: "es", groupValue: lang, onChanged: changeLocale),
            ],
          ),
          Row(
            children: [
              const Text("Portuguese"),
              Radio(value: "pt", groupValue: lang, onChanged: changeLocale),
            ],
          ),
           Row(
            children: [
              const Text("Francias"),
              Radio(value: "fr", groupValue: lang, onChanged: changeLocale),
            ],
          ),
           Row(
            children: [
              const Text("English"),
              Radio(value: "en", groupValue: lang, onChanged: changeLocale),
            ],
          ),
           Row(
            children: [
              const Text("Italiano"),
              Radio(value: "it", groupValue: lang, onChanged: changeLocale),
            ],
          ),
          Row(
            children: [
              const Text("中文的"),
              Radio(value: "zh", groupValue: lang, onChanged: changeLocale),
            ],
          ),
          Text("The current language is ${AppLocalizations.of(context)!.language}", style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          const SizedBox(height: 80,),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pushNamed(VideoScreen.routeName);
          }, child: const Text("Start Answering Question")),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pushNamed(DetailPage.routeName);
          }, child: const Text("Report Screen")),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pushNamed(Quiz.routeName);
          }, child: const Text("My Quiz")),
          ElevatedButton(onPressed: ()async{
             await FirebaseAuth.instance.signOut();
             Navigator.of(context).pushNamed(EmailSend.routeName);
          }, child: const Text("Email Send")),
          ElevatedButton(onPressed: ()async{
             await FirebaseAuth.instance.signOut();
             Navigator.of(context).pushNamed(StripePayment.routeName);
          }, child: const Text("Stripe")),
          ElevatedButton(onPressed: ()async{
             await FirebaseAuth.instance.signOut();
             Navigator.of(context).pushNamed(LoginScreen.routeName);
          }, child: const Text("Log out")),
        ],
      ),),
    );
  }
}