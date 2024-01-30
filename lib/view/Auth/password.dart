import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone/view/Auth/email.dart';
import 'package:insta_clone/view/Auth/signup_controller.dart';

class Password extends StatefulWidget {
  final username;
  Password({super.key, required this.username});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {

  SignupController controller = Get.put(SignupController());

  final passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(

        padding: const EdgeInsets.all(28.0),
        child:
        Obx(() => Column(
          children: [
            const SizedBox(height: 50),
            const Text('Create a password',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 26
              ),),
            const SizedBox(height: 10),
            const Text('For security, your password must be 6 characters or more',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 18),

            // Text Field
            TextFormField(
              onChanged: (text){
                if(text.length >= 6){
                  controller.shadeNormal();
                } else{
                  controller.shade100();
                }

              },
              controller: passController,
              obscureText: true,
              // Decoration
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Password',
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
            const SizedBox(height: 5),

            // Check Box
            Row(
              children: [
                Checkbox(value: controller.checkBox.value, onChanged: (bool? value){
                  controller.checkBox.value = value ?? false;
                }),
                const Text('Remember Password'),
              ],
            ),

            const SizedBox(height: 10),


            // Next Button
            Obx(() => InkWell(
              onTap: (){
                if(passController.text.length >= 6){
                  Get.to(Email(username: widget.username, password: passController.text));
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
            )),



          ],
        ),),

      ),
    );
  }
}
