import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:insta_clone/view/signup_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "English ",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "(United States)",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Image.asset(
                        "assets/images/text.png",
                        color: Colors.white,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Form(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                                hintText: 'Phone number, email or username',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                floatingLabelBehavior:
                                FloatingLabelBehavior.always,
                                fillColor:
                                const Color.fromARGB(255, 60, 60, 60),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.visibility_off,
                                  size: 20,
                                ),
                                contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                floatingLabelBehavior:
                                FloatingLabelBehavior.always,
                                fillColor:
                                const Color.fromARGB(255, 60, 60, 60),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 12, 48, 103),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Forgot your login details? ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "Get help logging in.",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 202, 222, 255),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: Divider()),
                                Text(
                                  "  OR  ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(child: Divider()),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.facebook),
                                    Text(
                                      ' Continue as *userName*',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                 Column(
                  children: [
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(SignUpScreen());
                            },
                            child: Text(
                              "Sign up.",
                              style: TextStyle(
                                color: Color.fromARGB(255, 202, 222, 255),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}