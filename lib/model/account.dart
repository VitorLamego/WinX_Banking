import 'dart:math';

import 'package:statz_banking/model/transaction.dart';

class Account {
  final double value;
  final String cardNumber;
  final String expiryDate;
  final bool isCreditCard;
  final double? limit;
  final List<Transaction> transactions;

  Account(
    this.value,
    this.cardNumber,
    this.expiryDate,
    this.transactions,
    this.isCreditCard,
    this.limit,
  );

  static String generateCardNumber(int number) {
    Random random = Random();
    int randomNumber = random.nextInt(800) + 1000;

    return "$randomNumber **** **** $number";
  }

  factory Account.fromJson(
      Map<String, dynamic> data, List<Transaction> transactions) {
    final String cardNumber = generateCardNumber(data["cardNumber"]);
    return Account(
      double.parse(data["value"]),
      cardNumber,
      "23/09",
      transactions,
      data["isCreditCard"],
      data["limit"] == null ? null : double.tryParse(data["limit"]),
    );
  }
}
