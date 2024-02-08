import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:insta_clone/firebase_options.dart';
import 'package:insta_clone/view/home_screen/bottom_navbar.dart';
import 'package:insta_clone/view/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:  BottomNavbar()
    );
  }
}
