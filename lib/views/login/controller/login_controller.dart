import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../interfaces/response_interface.dart';
import '../repository/login_repository.dart';

class LoginController {
  LoginController();

  // Controllers Fields
  final TextEditingController cpf = TextEditingController();
  final TextEditingController senha = TextEditingController();

  // Fiel Validation
  ValueNotifier<bool> validateCpf = ValueNotifier<bool>(true);
  ValueNotifier<bool> validateSenha = ValueNotifier<bool>(true);

   // Repository
  LoginRepository repository = LoginRepository();

  // Field Mask
  var maskFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);


  Future<int> logInButtonTrigger() async {
    ResponseInterface? response = await sendLogRequest();
    if (response != null) {
      if (response.statusCode == 200) {
        return 200;
      } else if (response.statusCode == 404 || response.statusCode == 503 || response.statusCode == 400) {
        return response.statusCode;
      }
    }
    return 0;
  }


    Future<ResponseInterface?> sendLogRequest() async {
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
    if(maskFormatter.isFill() && senha.text.length >= 8){
      validateCpf.value = true;
      validateSenha.value = true;
      return await repository.verifyUserRequest(maskFormatter.getUnmaskedText(), senha.text);

    }
    else{
      return null;
    }
  }
  void dispose() {
    cpf.dispose();
    senha.dispose();
    validateCpf.dispose();
    validateSenha.dispose();
  }
}