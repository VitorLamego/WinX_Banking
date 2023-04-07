import 'package:flutter/material.dart';
import 'package:statz_banking/views/home/home.dart';
import 'package:statz_banking/views/wallet/wallet.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.isHomeSelected});

  final bool isHomeSelected;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 24, 43, 73).withOpacity(.9),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: widget.isHomeSelected ? Colors.white : Colors.grey,
                    size: 30,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                        color:
                            widget.isHomeSelected ? Colors.white : Colors.grey,
                        fontSize: 12),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WalletPage(),
                    ));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wallet_outlined,
                    color: !widget.isHomeSelected ? Colors.white : Colors.grey,
                    size: 30,
                  ),
                  Text(
                    "Carteira",
                    style: TextStyle(
                      color:
                          !widget.isHomeSelected ? Colors.white : Colors.grey,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
