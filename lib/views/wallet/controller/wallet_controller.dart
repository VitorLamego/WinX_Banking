import 'package:flutter/material.dart';
import 'package:statz_banking/core/app_shared.dart';

import '../../../model/account.dart';
import '../../../model/transaction.dart';
import '../../home/components/history_card.dart';

class WalletController {
  ValueNotifier<int> buttonPressed = ValueNotifier(1);

  List<double> chartValues = [0.0, 0.0, 0.0];
  double totalValue = 0.0;

  List<Widget> createTransactionsList({bool filterDebit = false}) {
    List<Widget> transactionsHistory = [];
    List<dynamic> transactions = [];

    for (Account account in AppShared.actualUser.accounts!) {
      for (var element in account.transactions) {
        if (filterDebit) {
          if (element.value < 0.0) transactions.add(element);
        } else {
          transactions.add(element);
        }
      }
    }
    transactions.sort((a, b) {
      DateTime dateA = DateTime.parse(a.date);
      DateTime dateB = DateTime.parse(b.date);

      return dateA.compareTo(dateB);
    });

    for (Transaction element in transactions) {
      transactionsHistory.add(
        HistoryCard(
          imagePath: getBankMiniLogo(element.originBank),
          type: element.type,
          info: element.cpf,
          value: element.value,
          date: element.date,
        ),
      );
    }
    return transactionsHistory;
  }

  void updateBalance() {
    int i = 0;
    totalValue = 0.0;
    for (Account account in AppShared.actualUser.accounts!) {
      if (account.isCreditCard) {
        chartValues[i] = 0.0;
      } else {
        chartValues[i] = account.value;
      }
      totalValue += chartValues[i];
      i++;
    }
  }

  void updateSpent() {
    int i = 0;
    chartValues = [0.0, 0.0, 0.0];
    totalValue = 0.0;
    for (Account account in AppShared.actualUser.accounts!) {
      for (Transaction transaction in account.transactions) {
        if (transaction.value < 0.0) {
          chartValues[i] += transaction.value;
        }
      }
      chartValues[i] *= -1;
      totalValue += chartValues[i];
      i++;
    }
  }

  void updateLimit() {
    int i = 0;
    totalValue = 0.0;
    for (Account account in AppShared.actualUser.accounts!) {
      if (account.isCreditCard) {
        chartValues[i] = account.limit!;
      } else {
        chartValues[i] = 0.0;
      }
      totalValue += chartValues[i];
      i++;
    }
  }

  String getBankMiniLogo(String bankName) {
    if (bankName == "Banco BRB") {
      return "assets/images/home/minibrlogo.png";
    } else {
      return "assets/images/home/nubank1.png";
    }
  }
}
