import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmailSend extends StatelessWidget {
  const EmailSend({super.key});

  Future<int> sendEmail(String name, String email, String message)async{
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_s39rjkb";
    const templateId = "template_nkouyjm";
    const userId = "6M4uvdBz8ngpn9BD-";
    final response = await http.post(
      url,
      headers: {"Content-Type":"application/json"},
      body: json.encode({
        "service_id": serviceId,
        "template_id":templateId,
        'user_id': userId,
        'template_params': {
          'name': name,
          'email': email,
          'Subject': message
        }
      })
      );
      return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("hehe"),),
          ElevatedButton(onPressed: (){
            sendEmail("abd","abdullahayaz529@gmail.com","heyyyyy");
          }, child: Text("send email"))
        ],
      ),
    );
  }
}