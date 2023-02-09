import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginController extends GetxController {
  String inputNumber = "";
  bool isActiveButton = false;
  TextEditingController phoneController = TextEditingController();
  var numberMaskForma = MaskTextInputFormatter(
    mask: '+###-##-###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  void activeButton(String text) {
    if (inputNumber.length == 17) {
      isActiveButton = true;
      update();
    } else {
      isActiveButton = false;
      update();
    }
  }
}
