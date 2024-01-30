import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone/view/Auth/signup_controller.dart';

import 'confirm.dart';

class Email extends StatefulWidget {

  final username;
  final password;

  Email({super.key, required this.username, this.password});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {

  SignupController controller = Get.put(SignupController());

  final emailController = TextEditingController();

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
            Obx(() => TextFormField(
              onChanged: (text){
                if(text.isEmpty){
                  controller.falseShow();
                  controller.shade100();

                } else{
                  controller.trueShow();
                  controller.shadeNormal();
                }
              },
              controller: emailController,
              // Decoration
              decoration: InputDecoration(
                suffixIcon: controller.show.value? InkWell(
                    onTap: (){
                      emailController.clear();
                      controller.falseShow();
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
            )),

            const SizedBox(height: 10),
            // Next Button
            Obx(() =>InkWell(
              onTap: (){
                if (emailController.text.contains("@gmail.com") && emailController.text.isNotEmpty ){
                  Get.to(ConfirmPage(username: widget.username,password: widget.password,email: emailController.text));
                } else{
                  Get.snackbar('Validation Error', 'Invalid Email',icon: Icon(Icons.error,color: Colors.red,),
                      borderRadius: 25, colorText: Colors.red);
                }
              },
              child: Container(
                  height: 45,
                  width: 450,
                  decoration: BoxDecoration(
                      color: controller.buttonColor.value,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(
                      child: Text('Next',style: TextStyle(color: Colors.white),))
              ),
            ), )



          ],
        ),
      ),
    );
  }
}
