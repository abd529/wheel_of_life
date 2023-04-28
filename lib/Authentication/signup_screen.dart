// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wheel_of_life/Screens/onboard_screen.dart';

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
      appBar: AppBar(
        title: const Text('Sign Up'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _fNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _lNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
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
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  obscureText: true,
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
                ElevatedButton(
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
                  child: _isSigningUp
                    ? const CircularProgressIndicator()
                    : const Text('Sign Up'),
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
    );
  }
}
