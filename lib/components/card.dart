import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({
    super.key,
    required this.colors,
    required this.name,
    required this.bankImage,
    required this.bankName,
    required this.cardNumber,
  });

  final List<Color> colors;
  final String name;
  final String bankImage;
  final String bankName;
  final String cardNumber;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white.withOpacity(.4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.90),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(2, 4),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height * 0.04,
                    width: size.width * 0.2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(bankImage),
                    ),
                  ),
                  Container(
                    height: size.height * 0.02,
                    width: size.width * 0.1,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/home/contactless.png"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bankName,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    cardNumber,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "Expiry date",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      Text(
                        "06/27",
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
