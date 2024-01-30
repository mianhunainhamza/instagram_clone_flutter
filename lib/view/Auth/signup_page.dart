import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone/view/Auth/signup_controller.dart';

import 'password.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  SignupController controller = Get.put(SignupController());
  final usernameController = TextEditingController();

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
          Obx(() => TextFormField(
            controller: usernameController,
            onChanged: (text) async {
              controller.falseShow();
              final isUsernameUnique = await checkUserName(text);
              if(text.isEmpty){
                controller.falseShow();
                controller.falseEnable();
                controller.falseLoading();
                controller.blackMsg();
                controller.shade100();
              }
              else if(isUsernameUnique && text.isNotEmpty){
                controller.shadeNormal();
                controller.trueEnable();
                controller.trueShow();
                controller.falseLoading();
                //print('if');
              } else{
                controller.falseLoading();
                controller.falseShow();
                controller.falseEnable();
                controller.redMsg();
                controller.shade100();
                //print('else');
              }
            },
            // Decoration
            decoration: InputDecoration(
              suffixIcon: controller.show.value ? const Icon(Icons.check) : null ,
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
          )),

              const SizedBox(height: 14),

              // Next Button
              Obx(() => InkWell(

                onTap: controller.enable.value ? (){
                  Get.to(Password(username: usernameController.text));
                } : null,
                child: Container(
                    height: 45,
                    width: 450,
                    decoration: BoxDecoration(
                        color: controller.buttonColor.value,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child:Obx(() => controller.isLoading.value? const Center(child: CircularProgressIndicator(color: Colors.white,)):
                    const Center(
                        child: Text('Next',style: TextStyle(color: Colors.white),)))
                ),
              )),

              const SizedBox(height: 7),
              Obx(() => Text('Username already exist', style: TextStyle(
                  color: controller.errorMsgColor.value
              ),)),


            ],
          ),
        ),
      ),
    );
  }

  Future<bool> checkUserName(String text) async {
    try{
        if (text.isNotEmpty || text.isEmpty) {
          controller.trueLoading();
          controller.falseShow();
          controller.falseEnable();
          controller.blackMsg();
          controller.shade100();
        }
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

