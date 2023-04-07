import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.imagePath,
    required this.type,
    required this.info,
    required this.value,
    required this.date,
  });

  final String imagePath;
  final String type;
  final String info;
  final double value;
  final String date;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.07,
      margin: EdgeInsets.only(top: size.height * 0.02),
      padding: EdgeInsets.only(right: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.05,
                width: size.width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      imagePath,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    info,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value.toStringAsFixed(2).replaceAll('.', ','),
                style: TextStyle(
                    color: value > 0
                        ? const Color(0XFF52EC86)
                        : const Color(0XFFEC5252),
                    fontSize: 17),
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
