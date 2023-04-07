// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:statz_banking/views/home/components/blurry_container.dart';
import 'package:statz_banking/components/card.dart';
import 'package:statz_banking/views/home/components/history_card.dart';
import 'package:statz_banking/views/home/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  Widget _buildPageIndicator(Size size) {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(i == controller.currentCard
          ? _indicator(true, size)
          : _indicator(false, size));
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: list);
  }

  Widget _indicator(bool isActive, Size size) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: size.height * 0.008,
      width: size.width * 0.033,
      decoration: BoxDecoration(
          border: Border.all(
              color: isActive
                  ? const Color(0XFF3A4396).withOpacity(.8)
                  : Colors.grey),
          borderRadius: BorderRadius.circular(20),
          color:
              isActive ? const Color(0XFF3A4396).withOpacity(.8) : Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: SizedBox(
              height: size.height * 0.06,
              width: size.width,
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height * 0.05,
                      width: size.width * 0.2,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/home/profile.jpeg"))),
                    ),
                    const Text(
                      "R\$ 1240,98",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(
                      width: size.width * 0.2,
                      child: IconButton(
                        icon: Icon(
                          controller.balanceVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            controller.balanceVisible =
                                !controller.balanceVisible;
                          });
                        },
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: controller.balanceVisible,
                  child: Center(
                    child: BlurryContainer(
                      blur: 4,
                      child: SizedBox(
                        height: size.height * 0.06,
                        width: size.width * 0.3,
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.25,
            margin: EdgeInsets.only(bottom: size.height * 0.03),
            child: PageView(
              onPageChanged: (value) => setState(() {
                controller.currentCard = value;
              }),
              children: [
                SizedBox(
                  height: size.height * 0.25,
                  width: size.width,
                  child: Stack(
                    children: const [
                      CardComponent(
                        color1: Color.fromARGB(255, 222, 222, 233),
                        color2: Color.fromARGB(255, 203, 210, 77),
                      ),
                      Positioned(
                        top: 20,
                        child: CardComponent(
                          color1: Color(0XFFD0C4D3),
                          color2: Color(0xFFC584DC),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        child: CardComponent(
                          color1: Color(0XFFA0A2E5),
                          color2: Color(0XFF3A4396),
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: const CardComponent(
                    color1: Color(0XFFA0A2E5),
                    color2: Color(0XFF3A4396),
                  ),
                ),
                Center(
                  child: const CardComponent(
                    color1: Color(0XFFD0C4D3),
                    color2: Color(0xFFC584DC),
                  ),
                ),
                Center(
                  child: const CardComponent(
                    color1: Color(0XFFA0A2E5),
                    color2: Color.fromARGB(255, 163, 210, 77),
                  ),
                ),
              ],
            ),
          ),
          _buildPageIndicator(size),
          Container(
            height: size.height * 0.1,
            width: size.width,
            margin: EdgeInsets.only(top: size.height * 0.03),
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Fatura Atual: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "R\$ 456,98",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Limite Disponível: R\$ 1564,98",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Container(
                  height: size.height,
                  width: size.width * 0.03,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height * 0.1 * 0.5,
                      decoration: BoxDecoration(
                          color: Color(0XFF3A4396),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: size.width * 0.9,
              margin: EdgeInsets.only(top: size.height * 0.04),
              decoration: const BoxDecoration(
                color: Color(0XFF1E293A),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    HistoryCard(
                      imagePath: "assets/images/home/minibrlogo.png",
                      date: "23/02",
                      info: "073.092.323-21",
                      type: "Pix",
                      value: -345.23,
                    ),
                    HistoryCard(
                      imagePath: "assets/images/home/nubank1.png",
                      date: "23/02",
                      info: "322.214.332-21",
                      type: "Cartão de Crédito",
                      value: 543.23,
                    ),
                    HistoryCard(
                      imagePath: "assets/images/home/nubank1.png",
                      date: "23/02",
                      info: "542.434.632-21",
                      type: "TED",
                      value: 1000.00,
                    ),
                    HistoryCard(
                      imagePath: "assets/images/home/minibrlogo.png",
                      date: "23/02",
                      info: "073.092.323-21",
                      type: "Pix",
                      value: -129.23,
                    ),
                    HistoryCard(
                      imagePath: "assets/images/home/nubank1.png",
                      date: "23/02",
                      info: "073.092.323-21",
                      type: "Transferência",
                      value: 23.23,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0XFF151C27),
    );
  }
}
