import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text('Choose username',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 26
                ),),
              const SizedBox(height: 10),
              const Text('You can always change it later',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 14
              ),
              ),
              const SizedBox(height: 20),

              // TExt Field
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Username',
                  hintStyle: const TextStyle(color: Colors.grey),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: Colors.grey.shade800,
                  filled: true,
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Container(
                height: 45,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10)
              ),
                  child: const Center(
                      child: Text('Next',style: TextStyle(color: Colors.white),))
              )

            ],
          ),
        ),
      ),
    );
  }
}
