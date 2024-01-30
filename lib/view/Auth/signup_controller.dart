import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
   RxBool isLoading = false.obs;
   RxBool show = false.obs;
   RxBool enable = false.obs;
   Rx<Color> errorMsgColor = Colors.black.obs;

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
}