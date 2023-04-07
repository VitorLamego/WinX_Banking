import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvestmentCard extends StatelessWidget {
  const InvestmentCard({
    super.key,
    required this.investmentImage,
    required this.investment,
    required this.actualValue,
    required this.returnPercentage,
  });

  final String investmentImage;
  final String investment;
  final double actualValue;
  final double returnPercentage;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('###,###,###.##');
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        margin: EdgeInsets.only(top: size.height * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.08,
                  width: size.width * 0.17,
                  decoration: BoxDecoration(
                    color: const Color(0XFF1E293A).withOpacity(.9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/wallet/$investmentImage"),
                          ),
                        ),
                      ),
                      Text(
                        investment,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "R\$ ${formatter.format(actualValue).replaceAll(".", ',').replaceFirst(",", '.')}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                const Text(
                  "Atualmente",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 10),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "R\$ ${formatter.format((actualValue * (1 + returnPercentage))).replaceAll(".", ',').replaceFirst(",", '.')}",
                  style: const TextStyle(
                      color: Color(0XFF52EC86),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                const Text(
                  "Em 1 ano",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
