import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginController {
  LoginController();

  // Controllers Fields
  final TextEditingController cpf = TextEditingController();
  final TextEditingController senha = TextEditingController();

  // Fiel Validation
  ValueNotifier<bool> validateCpf = ValueNotifier<bool>(true);
  ValueNotifier<bool> validateSenha = ValueNotifier<bool>(true);

  // Field Mask
  var maskFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);


  void sendLogRequest() {
    if (maskFormatter.isFill()) {
      validateCpf.value = true;
    } else {
      validateCpf.value = false;
    }
    if(senha.text.length >= 8){
      validateSenha.value = true;
    }
    else{
      validateSenha.value = false;
    }
  }

  void dispose() {
    cpf.dispose();
    senha.dispose();
    validateCpf.dispose();
    validateSenha.dispose();
  }
}