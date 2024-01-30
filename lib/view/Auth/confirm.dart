import 'package:flutter/material.dart';

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
            SizedBox(height: 200 ,),
            Container(
                height: 120,
                child: Image.asset('assets/successImg.jpg')),
            SizedBox(height: 12),
            Center(child: Text('Welcome to instagram,',style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: Colors.white
            ),)),
            Center(child: Text(widget.username, style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),)),
            SizedBox(height: 19),
            InkWell(
              onTap: (){

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
                  fontSize: 11
                ),),
              ),
            ),
            Text('Terms, Privacy Policy , Cookies Policy', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12
            ),)
          ],
        ),
      ),
    );
  }
}
