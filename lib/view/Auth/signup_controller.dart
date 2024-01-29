import 'package:get/get.dart';

class SignupController extends GetxController{
  static RxBool isLoading = false.obs;

  trueLoading(){
    isLoading.value = true;
  }

  falseLoading(){
    isLoading.value = false;
  }
}