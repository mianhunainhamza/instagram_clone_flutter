import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'password.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool isLoading = false;
  bool show = false;
  bool enable = false;
  Color errorMsgColor = Colors.black;
  Color buttonColor = Colors.blueAccent.shade100;

  final usernameController = TextEditingController();

  SignUpScreen cont = Get.put(SignUpScreen());

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

              // Text Field
              TextFormField(
                controller: usernameController,
                onChanged: (text) async {
                  setState(() {
                    show = false;
                  });
                  final isUsernameUnique = await checkUserName(text);
                  if(text.isEmpty){
                    setState(() {
                      show = false;
                      enable = false;
                      isLoading = false;
                      errorMsgColor = Colors.black;
                      buttonColor = Colors.blueAccent.shade100;
                    });
                  }
                  else if(isUsernameUnique && text.isNotEmpty){
                    setState(() {
                      buttonColor = Colors.blueAccent;
                      enable = true;
                      show = true;
                      isLoading = false;
                    });
                    //print('if');
                  } else{
                    setState((){
                      isLoading = false;
                      show = false;
                      enable = false;
                      errorMsgColor = Colors.red;
                      buttonColor = Colors.blueAccent.shade100;
                    });
                    //print('else');
                  }
                },

                // Decoration
                decoration: InputDecoration(
                  suffixIcon: show ? const Icon(Icons.check) : null ,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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

              // Next Button
              InkWell(
                onTap: enable ? (){
                Get.to(Password(username: usernameController.text));
                } : null,
                child: Container(
                  height: 45,
                width: 450,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                    child: isLoading? const Center(child: CircularProgressIndicator(color: Colors.white,)):
                     const Center(
                         child: Text('Next',style: TextStyle(color: Colors.white),))
                ),
              ),
              const SizedBox(height: 7),
              Text('Username already exist', style: TextStyle(
                color: errorMsgColor
              ),)

            ],
          ),
        ),
      ),
    );
  }

  Future<bool> checkUserName(String text) async {
    try{
      setState(() {
        if (text.isNotEmpty || text.isEmpty) {
          isLoading = true;
          show = false;
          enable = false;
          errorMsgColor = Colors.black;
          buttonColor = Colors.blueAccent.shade100;
        }
      });
      FirebaseFirestore fire = FirebaseFirestore.instance;
      CollectionReference ref = fire.collection('User');
      QuerySnapshot snapshot = await ref.where('username',isEqualTo: text).get();
      print(text);
      return snapshot.docs.isEmpty;
    }catch (e){
      print(e.toString());
      return false;
    }
  }


}

