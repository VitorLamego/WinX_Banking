import 'package:flutter/material.dart';
import 'package:statz_banking/components/navbar.dart';
import 'package:statz_banking/views/home/components/blurry_container.dart';
import 'package:statz_banking/components/card.dart';
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
      list.add(i == controller.currentCard.value
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
  void initState() {
    controller.getOpenFinance();
    controller.currentCard.addListener(() {
      controller.updateCurrentAccount();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: controller.state,
        builder: (context, value, child) => value == HomePageState.LOADED
            ? Stack(
                children: [
                  ValueListenableBuilder(
                    valueListenable: controller.currentCard,
                    builder: (context, value, child) => Column(
                      children: [
                        SafeArea(
                          child: SizedBox(
                            height: size.height * 0.06,
                            width: size.width,
                            child: Stack(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: size.height * 0.05,
                                    width: size.width * 0.2,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/home/profile.jpeg"),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: controller.balance != null,
                                    child: Text(
                                      "R\$ ${controller.balance}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  ),
                                  Visibility(
                                    visible: controller.balance != null,
                                    child: SizedBox(
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
                                    ),
                                  )
                                ],
                              ),
                              Visibility(
                                visible: controller.balanceVisible,
                                child: Center(
                                  child: BlurryContainer(
                                    blur: 6,
                                    child: SizedBox(
                                      height: size.height * 0.06,
                                      width: size.width * 0.4,
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
                              controller.currentCard.value = value;
                            }),
                            children: [
                              SizedBox(
                                height: size.height * 0.25,
                                width: size.width,
                                child: Stack(
                                  children: [
                                    CardComponent(
                                      color1: const Color.fromARGB(
                                          255, 222, 222, 233),
                                      color2: const Color.fromARGB(
                                          255, 203, 210, 77),
                                      name: controller.createCreditCardName(),
                                    ),
                                    Positioned(
                                      top: 20,
                                      child: CardComponent(
                                        color1: const Color(0XFFD0C4D3),
                                        color2: const Color(0xFFC584DC),
                                        name: controller.createCreditCardName(),
                                      ),
                                    ),
                                    Positioned(
                                      top: 40,
                                      child: CardComponent(
                                        color1: const Color(0XFFA0A2E5),
                                        color2: const Color(0XFF3A4396),
                                        name: controller.createCreditCardName(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Center(
                                child: CardComponent(
                                  color1: const Color(0XFFA0A2E5),
                                  color2: const Color(0XFF3A4396),
                                  name: controller.createCreditCardName(),
                                ),
                              ),
                              Center(
                                child: CardComponent(
                                  color1: const Color(0XFFD0C4D3),
                                  color2: const Color(0xFFC584DC),
                                  name: controller.createCreditCardName(),
                                ),
                              ),
                              Center(
                                child: CardComponent(
                                  color1: const Color(0XFFA0A2E5),
                                  color2:
                                      const Color.fromARGB(255, 163, 210, 77),
                                  name: controller.createCreditCardName(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        _buildPageIndicator(size),
                        Visibility(
                          visible: controller.limit != null &&
                              controller.invoice != null,
                          child: Container(
                            height: size.height * 0.1,
                            width: size.width,
                            margin: EdgeInsets.only(top: size.height * 0.03),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Fatura Atual: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "R\$ ${controller.invoice}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Limite Disponível: R\$ ${controller.getCreditAvailable()}",
                                      style: const TextStyle(
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
                                      height: size.height *
                                          0.1 *
                                          controller.getLimitPercentUsed(),
                                      decoration: BoxDecoration(
                                          color: const Color(0XFF3A4396),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                children: controller.createTransactionsList(),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: NavBar(
                      isHomeSelected: true,
                    ),
                  )
                ],
              )
            : SizedBox(
                height: size.height,
                width: size.width,
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.purple),
                ),
              ),
      ),
      backgroundColor: const Color(0XFF151C27),
    );
  }
}
