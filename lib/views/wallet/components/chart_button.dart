import 'package:flutter/material.dart';

class ChartButton extends StatelessWidget {
  const ChartButton({super.key, required this.title, required this.imageName});

  final String title;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(Colors.transparent)),
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.3,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 24, 43, 73).withOpacity(.9),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.5),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              width: size.width * 0.1,
              height: size.height * 0.03,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/wallet/$imageName"),
                ),
              ),
            ),
            Text(title),
          ]),
        ),
      ),
    );
  }
}
