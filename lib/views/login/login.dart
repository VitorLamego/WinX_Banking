import 'package:flutter/material.dart';
import 'package:statz_banking/views/login/components/custom_field.dart';
import 'package:statz_banking/views/login/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = LoginController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
         Container(
                height: size.height * 0.07,
                width: size.width * 0.35,
                margin: EdgeInsets.only(left: size.width * 0.315, top: size. height *0.15),
                decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/BRB-Logo.png"),
                  fit: BoxFit.fitHeight),
            ),
          ),
          Container(margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),child: CustomField(leftMarginField: size.width *0,leftMarginText: size.width * 0.035, topMarginText: size.height * 0.37, heightContainerText: size.height * 0.08, widthContainerText: size.width * 0.2, topMarginField: size.height * 0.43, widthField: size.width * 0.9, heightField: size.height * 0.06, hasMask: true, hintText: '123.456.789-10', inputType: TextInputType.text, controller: controller.cpf, text: "Seu CPF", mask: controller.maskFormatter, topMarginError: size.height * 0.495, validate: controller.validateCpf, errorString: "CPF inválido",)),
          Container(margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),child: CustomField(leftMarginField: size.width *0,leftMarginText: size.width * 0.035, topMarginText: size.height * 0.50, heightContainerText: size.height * 0.085, widthContainerText: size.width * 0.25, topMarginField: size.height * 0.56, widthField: size.width * 0.9, heightField: size.height * 0.06, hasMask: false, hintText: 'min 8. caracteres', inputType: TextInputType.text, controller: controller.senha, text: "Sua Senha", mask: controller.maskFormatter,topMarginError: size.height * 0.625, validate: controller.validateSenha, errorString: "Senha inválida",)),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.75, left: size.width *0.27),
            width: size.width *0.45,
            height: size.height *0.06,
              child: ElevatedButton(
                onPressed: () {
                  controller.sendLogRequest();              
                },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color(0XFF2983FB),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.zero,
                ),
              ),
                child: Column(
                  mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: size.height * 0.015), 
                          child: Text("Login")
                        )
                                      
                      ],
                ),
              ),
          ),
        ],
      ),
      backgroundColor: Color(0XFF151C27),
    );
  }
}