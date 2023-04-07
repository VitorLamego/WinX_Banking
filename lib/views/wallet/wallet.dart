import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:statz_banking/components/navbar.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [],
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
