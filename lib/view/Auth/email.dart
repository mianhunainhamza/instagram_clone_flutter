import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'confirm.dart';

class Email extends StatefulWidget {

  final username;
  final password;

  Email({super.key, required this.username, this.password});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {

  final emailController = TextEditingController();
  bool isLoading = false;
  bool show = false;
  Color buttonColor = Colors.blueAccent.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(

        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text('Add email',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 26
              ),),

            const SizedBox(height: 25),

            // Text Field
            TextFormField(
              onChanged: (text){
                if(text.isEmpty){
                  setState(() {
                    show = false;
                    buttonColor = Colors.blueAccent.shade100;
                  });

                } else{
                  setState(() {
                    show = true;
                    buttonColor = Colors.blueAccent;
                  });
                }
              },
              controller: emailController,
              // Decoration
              decoration: InputDecoration(
                suffixIcon: show? InkWell(
                    onTap: (){
                      emailController.clear();
                      setState(() {
                        show = false;
                      });
                    },
                    child: const Icon(Icons.delete)): null,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Email',
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
            const SizedBox(height: 10),
            // Next Button
            InkWell(
              onTap: (){
                if (emailController.text.contains("@gmail.com") && emailController.text.isNotEmpty ){
                  Get.to(ConfirmPage(username: widget.username,password: widget.password,email: emailController.text));
                } else{
                  Get.snackbar('Email Error', 'Invalid Email',icon: Icon(Icons.error),
                      borderRadius: 20);
                }
              },
              child: Container(
                  height: 45,
                  width: 450,
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:isLoading? const Center(child: CircularProgressIndicator(color: Colors.white,)):
                  const Center(
                      child: Text('Next',style: TextStyle(color: Colors.white),))
              ),
            ),


          ],
        ),
      ),
    );
  }
}
