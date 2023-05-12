// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wheel_of_life/Screens/onboard_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Models/register_VM.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  bool _isSigningUp = false;
  bool obsCheck1 = false;
  bool obsCheck2 = false;
  final RegisterViewModel _registerVM = RegisterViewModel();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                   Column(
                      children: [
                        SvgPicture.asset(
                         "assets/logo.svg",
                         width: 85,
                         height: 85,
                        ),
                      ],
                    ),
              const Text("Sign up", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              const Text("Create an account here", style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 44,),
                  TextFormField(
                    controller: _fNameController,
                    decoration: InputDecoration(
                       prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                              right:   BorderSide(width: 1.0, color: Colors.black),
                            ),
                        ),
                        child: const Icon(Icons.person_outline)),
                    ),
                      labelText: 'First Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _lNameController,
                    decoration:  InputDecoration(
                      prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                              right:   BorderSide(width: 1.0, color: Colors.black),
                            ),
                        ),
                        child: const Icon(Icons.person_outline)),
                    ),
                      labelText: 'Last Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
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
                      else if(!value.contains("@")){
                        return "enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        decoration: const BoxDecoration(
                              border: Border(
                                right:   BorderSide(width: 1.0, color: Colors.black),
                              ),
                          ),
                        child: const Icon(Icons.lock_open_rounded)),
                    ),
                      labelText: 'Password',
                       suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        obsCheck1 =!obsCheck1;
                      });
                    }, icon: Icon( obsCheck1? Icons.visibility_off : Icons.visibility))
                    ),
                    obscureText: obsCheck1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        decoration: const BoxDecoration(
                              border: Border(
                                right:   BorderSide(width: 1.0, color: Colors.black),
                              ),
                          ),
                        child: const Icon(Icons.lock_outline)),
                    ),
                      labelText: 'Confirm Password',
                       suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        obsCheck2 =!obsCheck2;
                      });
                    }, icon: Icon( obsCheck2? Icons.visibility_off : Icons.visibility))
                    ),
                    obscureText: obsCheck2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: ElevatedButton(
                      onPressed: _isSigningUp ? null : () async{
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isSigningUp = true;
                          });
                          // call Firebase function to sign up user
                          bool isRegistered = false;
                           isRegistered = await _registerVM.register(_emailController.text.trim(),
                                _passwordController.text.trim(), _fNameController.text.trim(), _lNameController.text.trim());
                          if (isRegistered) {
                            var userId = FirebaseAuth.instance.currentUser!.uid;
                            await FirebaseFirestore.instance.collection("UsersData").doc(userId).set({"First Name":_fNameController.text.trim(), "Last Name":_lNameController.text.trim(),"Email":_emailController.text.trim()});
                            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (ctx) => const Onboard()),
                                (Route<dynamic> route) => false);
                         }
                        }
                      },
                       style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                          shape: RoundedRectangleBorder( //to set border radius to button
                    borderRadius: BorderRadius.circular(50)
                              ),
                      ),
                      child: _isSigningUp
                        ? const CircularProgressIndicator()
                        : const Text('Sign Up'),
                    ),
                  ),
                   TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text('Already have an account? Login up here'),
                ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
