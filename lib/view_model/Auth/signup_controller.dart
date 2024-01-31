import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
   RxBool isLoading = false.obs;
   RxBool show = false.obs;
   RxBool enable = false.obs;
   Rx<Color> errorMsgColor = Colors.black.obs;
   Rx<Color> buttonColor = Colors.blueAccent.shade100.obs;
   RxBool checkBox = false.obs;
  trueLoading(){
    isLoading.value = true;
  }

  falseLoading(){
    isLoading.value = false;
  }

  trueShow(){
    show.value = true;
  }

  falseShow(){
     show.value = false;
   }

   trueEnable(){
    enable.value = true;
   }

   falseEnable(){
    enable.value = false;
   }

   blackMsg(){
    errorMsgColor.value = Colors.black;
   }

   redMsg(){
    errorMsgColor.value = Colors.red;
   }

   shade100() {
    buttonColor.value = Colors.blueAccent.shade100;
   }

   shadeNormal(){
    buttonColor.value = Colors.blueAccent;
   }
}