import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:statz_banking/components/navbar.dart';
import 'package:statz_banking/core/app_shared.dart';
import 'package:statz_banking/views/wallet/components/chart_button.dart';
import 'package:statz_banking/views/wallet/components/investment_card.dart';
import 'package:statz_banking/views/wallet/controller/wallet_controller.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  WalletController controller = WalletController();

  @override
  void initState() {
    controller.updateBalance();
    super.initState();
  }

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
                            function: () {
                              controller.updateBalance();
                              controller.buttonPressed.value = 1;
                            }),
                        ChartButton(
                          title: "Gastos",
                          imageName: "no-money.png",
                          isSelected: controller.buttonPressed.value == 2,
                          function: () {
                            controller.updateSpent();
                            controller.buttonPressed.value = 2;
                          },
                        ),
                        ChartButton(
                          title: "Limite",
                          imageName: "limit.png",
                          isSelected: controller.buttonPressed.value == 3,
                          function: () {
                            controller.updateLimit();
                            controller.buttonPressed.value = 3;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: controller.buttonPressed,
                builder: (context, value, child) => Center(
                  child: Container(
                    height: size.height * 0.2,
                    width: size.width * 0.8,
                    margin: EdgeInsets.only(top: size.height * 0.01),
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: controller.chartValues[0],
                            color: Colors.purple,
                            radius: 15,
                            showTitle: false,
                          ),
                          PieChartSectionData(
                            value: controller.chartValues[1],
                            color: Colors.blue,
                            radius: 15,
                            showTitle: false,
                          ),
                          PieChartSectionData(
                            value: controller.chartValues[2],
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
                        ValueListenableBuilder(
                          valueListenable: controller.buttonPressed,
                          builder: (context, value, child) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${AppShared.actualUser.accounts?[0].bankName}${AppShared.actualUser.accounts?[0].cardNumber.substring(AppShared.actualUser.accounts![0].cardNumber.length - 4)}",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                              Text(
                                controller.chartValues[0] == 0.0
                                    ? "----"
                                    : controller.chartValues[0]
                                        .toStringAsFixed(2),
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
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
                        ValueListenableBuilder(
                          valueListenable: controller.buttonPressed,
                          builder: (context, value, child) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${AppShared.actualUser.accounts?[1].bankName}${AppShared.actualUser.accounts?[1].cardNumber.substring(AppShared.actualUser.accounts![1].cardNumber.length - 4)}",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                              Text(
                                controller.chartValues[1] == 0.0
                                    ? "----"
                                    : controller.chartValues[1]
                                        .toStringAsFixed(2),
                                style: const TextStyle(
                                    color: Colors.purple,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
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
                        ValueListenableBuilder(
                          valueListenable: controller.buttonPressed,
                          builder: (context, value, child) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${AppShared.actualUser.accounts?[2].bankName}${AppShared.actualUser.accounts?[2].cardNumber.substring(AppShared.actualUser.accounts![2].cardNumber.length - 4)}",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                              Text(
                                controller.chartValues[2] == 0.0
                                    ? "----"
                                    : controller.chartValues[2]
                                        .toStringAsFixed(2),
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
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
                                  children: controller.createTransactionsList(
                                      filterDebit:
                                          controller.buttonPressed.value == 2)),
                            ),
                          ),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: size.width * 0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                Container(
                                  child: const Text(
                                    "Simulação Para Dinheiro fora do BRB",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 6,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InvestmentCard(
                            investmentImage: "poupanca.png",
                            investment: "Poupança",
                            actualValue:
                                AppShared.actualUser.accounts![2].value,
                            returnPercentage: 0.05,
                          ),
                          InvestmentCard(
                            investmentImage: "real-state.png",
                            investment: "LCI e LCA",
                            actualValue:
                                AppShared.actualUser.accounts![2].value,
                            returnPercentage: 0.02,
                          ),
                          InvestmentCard(
                            investmentImage: "certificate.png",
                            investment: "CDB",
                            actualValue:
                                AppShared.actualUser.accounts![2].value,
                            returnPercentage: 0.01,
                          ),
                        ],
                      ),
              ),
            ],
          ),
          SafeArea(
            child: Container(
              width: size.width,
              margin: EdgeInsets.only(top: size.height * 0.205),
              height: size.width * 0.1,
              child: ValueListenableBuilder(
                valueListenable: controller.buttonPressed,
                builder: (context, value, child) => Center(
                  child: Column(
                    children: [
                      Text(
                        "R\$ ${controller.totalValue.toStringAsFixed(2)}",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
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
