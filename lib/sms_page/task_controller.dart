import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SmsController extends GetxController {
  TextEditingController pinCodeController = TextEditingController();
  bool isSmsCorrect=true;
  void activeButton(String text) {
    if(text.length==4){
      if (text == "2222") {
        isSmsCorrect = true;
        update();
      } else {
        isSmsCorrect = false;
        update();
      }
    }

  }
}