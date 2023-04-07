import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:statz_banking/components/navbar.dart';
import 'package:statz_banking/views/wallet/components/chart_button.dart';
import 'package:statz_banking/views/wallet/components/pie_chart.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SafeArea(
                child: Container(
                  width: size.width,
                  height: size.height * 0.07,
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ChartButton(
                        title: "Saldo",
                        imageName: "money.png",
                      ),
                      ChartButton(
                        title: "Gastos",
                        imageName: "no-money.png",
                      ),
                      ChartButton(
                        title: "Limite",
                        imageName: "limit.png",
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: size.height * 0.2,
                  width: size.width * 0.8,
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  child: PieChart(
                    PieChartData(sections: [
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
                    ], pieTouchData: PieTouchData(enabled: true)),
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
                          children: [
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
                          children: [
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
                          children: [
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
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: NavBar(isHomeSelected: false),
          )
        ],
      ),
      backgroundColor: const Color(0XFF151C27),
    );
  }
}
