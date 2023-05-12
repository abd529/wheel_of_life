// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wheel_of_life/Authentication/email_sent.dart';
import 'package:wheel_of_life/Models/forgot_password_VM.dart';
import 'package:wheel_of_life/Screens/onboard_screen.dart';


class ForgotPassword extends StatefulWidget {
  static const routeName = "forgot-password";

   ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  ForgotPasswordViewModel forgotVM = ForgotPasswordViewModel();
  TextEditingController _emailController = TextEditingController();

  bool _emailSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackButton(),
                          SvgPicture.asset(
                           "assets/logo.svg",
                           width: 85,
                           height: 85,
                          ),
                          const SizedBox(width: 50,)
                        ],
                      ),
                const Text("Forgot Password", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                const Text("Receive password reset email", style: TextStyle(color: Colors.grey),),
                const SizedBox(height: 44,),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                right:   BorderSide(width: 1.0, color: Colors.black),
                              ),
                          ),
                          child: const Icon(Icons.email_outlined)),
                      ),
                      labelText: 'Email Address',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                 Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),

                   child: ElevatedButton(
                        onPressed: _emailSent ? null : () async{
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _emailSent = true;
                            });
                            // call Firebase function to sign up user
                           await forgotVM.resetPassword(_emailController.text);
                            
                              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (ctx) => const EmailSent()),
                                  (Route<dynamic> route) => false);
                           }
                        },
                         style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0,20,0,20),
                            shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(50)
                                ),
                        ),
                        child: _emailSent
                          ? const CircularProgressIndicator()
                          : const Text('Reset Password'),
                      ),
                 ),        
          ],
        ),
      )),
    );
  }
}