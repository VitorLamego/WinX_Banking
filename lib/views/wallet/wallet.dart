import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:statz_banking/components/navbar.dart';
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
              Center(
                child: Container(
                  height: size.height * 0.2,
                  width: size.width * 0.8,
                  margin: EdgeInsets.only(top: size.height * 0.1),
                  child: PieChart(
                    PieChartData(sections: [
                      PieChartSectionData(
                        value: 30,
                        color: Colors.purple,
                        radius: 15,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                          value: 20,
                          color: Colors.blue,
                          radius: 15,
                          showTitle: false)
                    ], pieTouchData: PieTouchData(enabled: true)),
                  ),
                ),
              ),
              PieChartSample2()
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
