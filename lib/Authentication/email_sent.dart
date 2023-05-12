import 'package:flutter/material.dart';

class EmailSent extends StatefulWidget {
  const EmailSent({super.key});

  @override
  State<EmailSent> createState() => _EmailSentState();
}

class _EmailSentState extends State<EmailSent> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:Text("Email Sent"))
      );
  }
}