import 'package:statz_banking/model/transaction.dart';

class Account {
  final String name;
  final double value;
  final double cardNumber;
  final String clientName;
  final String expiryDate;
  final bool isCreditCard;
  final double? limit;
  final List<Transaction> transactions;

  Account(this.name, this.value, this.cardNumber, this.clientName,
      this.expiryDate, this.transactions, this.isCreditCard, this.limit);
}
