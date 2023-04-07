import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:statz_banking/views/signup/repository/signup_repository.dart';

import '../../../interfaces/response_interface.dart';

class SignupController {
  SignupController();

  // Controllers Fields
  final TextEditingController cpf = TextEditingController();
  final TextEditingController senha = TextEditingController();
  final TextEditingController name = TextEditingController();

  // Fiel Validation
  ValueNotifier<bool> validateCpf = ValueNotifier<bool>(true);
  ValueNotifier<bool> validateSenha = ValueNotifier<bool>(true);
  ValueNotifier<bool> validateName = ValueNotifier<bool>(true);

   // Repository
  SignupRepository repository = SignupRepository();

  // Field Mask
  var maskFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);


  Future<int> logInButtonTrigger() async {
    ResponseInterface? response = await sendLogRequest();
    if (response != null) {
      if (response.statusCode == 201) {
        return 201;
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
    if(name.text.length != 0){
      validateName.value = true;
    }
    else{
      validateName.value = false;
    }
    if(maskFormatter.isFill() && senha.text.length >= 8 && name.text.length != 0){
      validateCpf.value = true;
      validateSenha.value = true;
      validateName.value = true;
      return await repository.verifyUserRequest(maskFormatter.getUnmaskedText(), senha.text, name.text);

    }
    else{
      return null;
    }
  }
  void dispose() {
    cpf.dispose();
    senha.dispose();
    name.dispose();
    validateCpf.dispose();
    validateSenha.dispose();
    validateName.dispose();
  }
}