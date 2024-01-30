import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:insta_clone/Model/user_modal.dart';
import 'package:insta_clone/view/Auth/signup_page.dart';

class ConfirmPage extends StatefulWidget {

  final username;
  final password;
  final email;

  const ConfirmPage({
    super.key,
    required this.username,
    required this.password,
    required this.email
  });

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200 ),


            // Image
            Container(
                height: 120,
                child: Image.asset('assets/successImg.jpg')),
            SizedBox(height: 12),

            // Welcome Text
            Center(child: Text('Welcome to instagram,',style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: Colors.white
            ),)),
            Center(child: Text(widget.username, style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),)),
            SizedBox(height: 30),

            // Sign up button
            InkWell(
              onTap: ()async{
                await createUser(widget.email, widget.password);
                await addUser();
              },
              child: Container(
                  height: 45,
                  width: 450,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:isLoading? const Center(child: CircularProgressIndicator(color: Colors.white,)):
                  const Center(
                      child: Text('Complete sign up',style: TextStyle(color: Colors.white),))
              ),
            ),
            SizedBox(height: 100),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('We will add private info from ${widget.email} to ${widget.username}. See ', style: TextStyle(
                  fontSize: 10
                ),),
              ),
            ),
            Text('Terms, Privacy Policy , Cookies Policy', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11
            ),)
          ],
        ),
      ),
    );
  }


  // Auth account
  Future<void> createUser(String email, String password) async {
    try {
      setState((){
        isLoading = true;
      });
      print('login true');
      FirebaseAuth _auth = FirebaseAuth.instance;
      print('Instance ');
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print('created');
      Get.snackbar('Success', 'Account created successfully', duration: Duration(seconds: 2));
      //Get.to(SignUpScreen());

    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      Get.snackbar('Auth Error',e.toString());
      print(widget.email);
    }

  }

  // Firebase add
  Future<void> addUser() async {
    try {
        setState(() {
          isLoading = true;
        });
      CollectionReference ref = FirebaseFirestore.instance.collection('User');
      print('instance created for firestore');
      UserModal user = UserModal(
          username: widget.username,
          password: widget.password,
          email: widget.email
      );
        print('user modal created for firestore');
      await ref.add(user.toJson());
        print('added');
      setState(() {
        isLoading = false;
      });
      Get.snackbar('Success', 'Added successfully');

    }  catch (e) {
      setState(() {
        isLoading = false;
      });
      Get.snackbar('FireStore Error',e.toString());
    }
  }
}
