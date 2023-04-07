import 'package:flutter/material.dart';
import 'package:statz_banking/components/card.dart';
import 'package:statz_banking/views/login/login.dart';
import 'dart:math' as math;

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
            children:[
              Container(
                height: size.height * 0.03,
                width: size.width * 0.15,
                margin: EdgeInsets.only(left: size.width * 0.06, top: size. height *0.08),
                decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/BRB-Logo.png"),
                  fit: BoxFit.fitHeight),
            ),
          ),
          Positioned(
            
            left: size.width *0.08,
            top: size.height * 0.29,
                child: Transform.rotate(angle: - math.pi/10 ,child:CardComponent(    
                  color1: Color(0XFFD0C4D3),
                  color2: Color(0xFFC584DC)),)
          ),
          Positioned(
            
            left: - size.width *0.06,
            top: size.height * 0.22,
            child: Transform.rotate(angle: - math.pi/6,
                child: CardComponent(    
                   color1: Color(0XFFA0A2E5),
                          color2: Color(0XFF3A4396),
                          ),
            ),
          ),
          
    
          
          Container(
                    margin: EdgeInsets.only(left: size.width * 0.06, top: size.height * 0.6),
                    height: size.height * 0.1,
                    width: size.width * 0.56,
                    child: const FittedBox(
                      child: Text(
                        "BRB Open-Finance\nMobile App",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
  
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.73, left: size.width *0.06),
                    width: size.width *0.45,
                    height: size.height *0.06,
                     child: ElevatedButton(
                              onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LoginPage(),
                                      )
                                      );
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
                  Container(
                        margin: EdgeInsets.only(left: size.width * 0.07, top: size.height * 0.8),
                        child: Row(
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: size.width * 0.01),
                              child: InkWell(
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0XFF2983FB),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins"),
                                ),
                                onTap: () {
                                 
                                },
                              ),
                            )
                          ],
                        ),
                      )
        ],
      ),
      backgroundColor: Color(0XFF151C27),
    );
  }
}