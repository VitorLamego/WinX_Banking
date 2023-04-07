import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomField extends StatelessWidget {
  const CustomField({
  required this.leftMarginText,
  required this.topMarginText,
  required this.heightContainerText,
  required this.widthContainerText,
  required this.topMarginField,
  required this.widthField,
  required this.heightField,
  required this.leftMarginField,
  required this.controller,
  required this.inputType,
  required this.hintText,
  required this.hasMask,
  required this.text,
  required this.mask,
  required this.validate,
  required this.topMarginError,
  required this.errorString,
  required this.obscureText,
  super.key});

  final double leftMarginText;
  final double topMarginText;
  final double heightContainerText;
  final double widthContainerText;
  final double topMarginField;
  final double widthField;
  final double heightField;
  final double leftMarginField;
  final TextInputType inputType;
  final bool hasMask;
  final String hintText;
  final TextEditingController controller;
  final String text;
  final MaskTextInputFormatter mask;
  final ValueNotifier<bool>  validate;
  final String errorString;
  final double topMarginError;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Container(
                margin: EdgeInsets.only(left: leftMarginText, top: topMarginText),
                height: heightContainerText,
                width: widthContainerText,
                child:  FittedBox(
                  child: Text(
                    text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                    ),
                  ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius:  BorderRadius.all(Radius.circular(20)),
                    color: Color(0XFF1E293A),
              ),
              margin: EdgeInsets.only(left: leftMarginField, top: topMarginField),
              height: heightField,
              width: widthField ,
              child: Center( child: Row(children: [
                const SizedBox(width: 15),
                Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      inputFormatters: hasMask ? [mask] : null,
                      controller: controller,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                        ),
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                      keyboardType: inputType,
                    ),
                  ),
              ])
              ),
            ),
            ValueListenableBuilder(
          valueListenable: validate,
          builder: (context, value, child) => value
              ? Container()
              : Container(
                  margin: EdgeInsets.only(left: leftMarginText, top: topMarginError),
                  child: Row(
                    children: [
                      Text(
                        errorString,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 12),
                      )
                    ],
                  ),
                ))

      ]
    );
  }
}