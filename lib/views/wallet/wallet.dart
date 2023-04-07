import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:statz_banking/components/navbar.dart';
import 'package:statz_banking/views/wallet/components/chart_button.dart';
import 'package:statz_banking/views/wallet/components/investment_card.dart';
import 'package:statz_banking/views/wallet/controller/wallet_controller.dart';

import '../home/components/history_card.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  WalletController controller = WalletController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Container(
                  width: size.width,
                  height: size.height * 0.07,
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: ValueListenableBuilder(
                    valueListenable: controller.buttonPressed,
                    builder: (context, value, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChartButton(
                          title: "Saldo",
                          imageName: "money.png",
                          isSelected: controller.buttonPressed.value == 1,
                          function: () => controller.buttonPressed.value = 1,
                        ),
                        ChartButton(
                          title: "Gastos",
                          imageName: "no-money.png",
                          isSelected: controller.buttonPressed.value == 2,
                          function: () => controller.buttonPressed.value = 2,
                        ),
                        ChartButton(
                          title: "Limite",
                          imageName: "limit.png",
                          isSelected: controller.buttonPressed.value == 3,
                          function: () => controller.buttonPressed.value = 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: size.height * 0.2,
                  width: size.width * 0.8,
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: 12093.32,
                          color: Colors.purple,
                          radius: 15,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 9093.32,
                          color: Colors.blue,
                          radius: 15,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 1093.32,
                          color: Colors.red,
                          radius: 15,
                          showTitle: false,
                        ),
                      ],
                      pieTouchData: PieTouchData(enabled: true),
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.07,
                width: size.width,
                margin: EdgeInsets.only(
                  top: size.height * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.005,
                      color: Colors.grey,
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "BRB 0345",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),
                            ),
                            Text(
                              "R\$ 9.093,32",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Container(
                          width: size.width * 0.005,
                          color: Colors.grey,
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Nu 1273",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),
                            ),
                            Text(
                              "R\$ 12.093,32",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Container(
                          width: size.width * 0.005,
                          color: Colors.grey,
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "BRB 4930",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),
                            ),
                            Text(
                              "R\$ 1.093,32",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Container(
                          width: size.width * 0.005,
                          color: Colors.grey,
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: controller.buttonPressed,
                builder: (context, value, child) => controller
                            .buttonPressed.value !=
                        1
                    ? Expanded(
                        child: Center(
                          child: Container(
                            width: size.width * 0.9,
                            margin: EdgeInsets.only(top: size.height * 0.05),
                            decoration: const BoxDecoration(
                              color: Color(0XFF1E293A),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const HistoryCard(
                                    imagePath:
                                        "assets/images/home/minibrlogo.png",
                                    date: "23/02",
                                    info: "073.092.323-21",
                                    type: "Pix",
                                    value: -345.23,
                                  ),
                                  const HistoryCard(
                                    imagePath: "assets/images/home/nubank1.png",
                                    date: "23/02",
                                    info: "322.214.332-21",
                                    type: "Cartão de Crédito",
                                    value: 543.23,
                                  ),
                                  const HistoryCard(
                                    imagePath: "assets/images/home/nubank1.png",
                                    date: "23/02",
                                    info: "542.434.632-21",
                                    type: "TED",
                                    value: 1000.00,
                                  ),
                                  const HistoryCard(
                                    imagePath:
                                        "assets/images/home/minibrlogo.png",
                                    date: "23/02",
                                    info: "073.092.323-21",
                                    type: "Pix",
                                    value: -129.23,
                                  ),
                                  const HistoryCard(
                                    imagePath: "assets/images/home/nubank1.png",
                                    date: "23/02",
                                    info: "073.092.323-21",
                                    type: "Transferência",
                                    value: 23.23,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.2,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: size.height * 0.03,
                                left: size.width * 0.04),
                            child: const Text(
                              "Investindo no BRB",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          const InvestmentCard(
                            investmentImage: "poupanca.png",
                            investment: "Poupança",
                            actualValue: 12903.32,
                            returnPercentage: 0.05,
                          ),
                          const InvestmentCard(
                            investmentImage: "real-state.png",
                            investment: "LCI e LCA",
                            actualValue: 12903.32,
                            returnPercentage: 0.02,
                          ),
                          const InvestmentCard(
                            investmentImage: "certificate.png",
                            investment: "CDB",
                            actualValue: 12903.32,
                            returnPercentage: 0.01,
                          ),
                        ],
                      ),
              ),
            ],
          ),
          Container(
            width: size.width,
            margin: EdgeInsets.only(top: size.height * 0.265),
            height: size.width * 0.1,
            child: const Center(
              child: Text(
                "R\$ 23.089,96",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: NavBar(isHomeSelected: false),
          )
        ],
      ),
      backgroundColor: const Color(0XFF151C27),
    );
  }
}
