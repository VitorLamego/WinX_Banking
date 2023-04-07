import 'package:flutter/material.dart';
import 'package:statz_banking/core/app_shared.dart';

import '../../../model/account.dart';
import '../../../model/transaction.dart';
import '../../home/components/history_card.dart';

class WalletController {
  ValueNotifier<int> buttonPressed = ValueNotifier(1);

  double totalSaldo(){
    double soma = 0;
    for(Account account in AppShared.actualUser.accounts!){
      if(account.isCreditCard){
        soma = soma;
      }
      if(account.isCreditCard == false){
        soma = soma + account.value;
      }
    }
    return soma;
  }

   double totalGastos(){
    double soma = 0;
    for(Account account in AppShared.actualUser.accounts!){
      if(account.isCreditCard){
        soma = soma + account.value;
      }
      if(account.isCreditCard == false){
        soma = soma;
      }
    }
    return soma;
  }

  double totalLimite(){
    double soma = 0;
    for(Account account in AppShared.actualUser.accounts!){
      if(account.isCreditCard){
        soma = soma + account.limit!;
      }
      if(account.isCreditCard == false){
        soma = soma;
      }
    }
    return soma;
  }
  List<Widget> createTransactionsList() {
    List<Widget> transactionsHistory = [];
     List<dynamic> transactions = [];

     
      for (Account account in AppShared.actualUser.accounts!) {
        for (var element in account.transactions) {
          transactions.add(element);
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
    String getBankMiniLogo(String bankName) {
    if (bankName == "Banco BRB") {
      return "assets/images/home/minibrlogo.png";
    } else {
      return "assets/images/home/nubank1.png";
    }
  }
}
