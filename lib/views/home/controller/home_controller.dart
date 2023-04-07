// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:statz_banking/core/app_shared.dart';
import 'package:statz_banking/interfaces/response_interface.dart';
import 'package:statz_banking/model/account.dart';
import 'package:statz_banking/model/transaction.dart';
import 'package:statz_banking/views/home/components/history_card.dart';
import 'package:statz_banking/views/home/repository/home_repository.dart';

enum HomePageState { LOADING, LOADED }

class HomeController {
  ValueNotifier<int> currentCard = ValueNotifier(0);
  bool balanceVisible = true;

  ValueNotifier<HomePageState> state =
      ValueNotifier<HomePageState>(HomePageState.LOADING);

  double? balance;
  bool isCreditCard = true;
  double? invoice = 10.0;
  double? limit = 20.0;

  HomeRepository repository = HomeRepository();

  updateCurrentAccount() {
    invoice = 0.0;
    limit = 0.0;
    balance = 0.0;
    if (currentCard.value == 0) {
      for (Account account in AppShared.actualUser.accounts!) {
        if (account.isCreditCard) {
          invoice = invoice! + account.value;
          limit = limit! + account.limit!;
        } else {
          balance = balance! + account.value;
        }
      }
    } else {
      Account actualAccount =
          AppShared.actualUser.accounts![currentCard.value - 1];
      isCreditCard = actualAccount.isCreditCard;
      if (isCreditCard) {
        balance = null;
        invoice = actualAccount.value;
        limit = actualAccount.limit;
      } else {
        balance = actualAccount.value;
        invoice = null;
        limit = null;
      }
    }
  }

  List<Widget> createTransactionsList() {
    List<Widget> transactionsHistory = [];

    if (currentCard.value == 0) {
      for (Account account in AppShared.actualUser.accounts!) {
        for (var element in account.transactions) {
          transactionsHistory.add(
            HistoryCard(
              imagePath: getBankLogo(account.bankName),
              type: element.type,
              info: element.cpf,
              value: element.value,
              date: element.date,
            ),
          );
        }
      }
    } else {
      Account actualAccount =
          AppShared.actualUser.accounts![currentCard.value - 1];
      for (var element in actualAccount.transactions) {
        transactionsHistory.add(
          HistoryCard(
            imagePath: getBankLogo(actualAccount.bankName),
            type: element.type,
            info: element.cpf,
            value: element.value,
            date: element.date,
          ),
        );
      }
    }

    return transactionsHistory;
  }

  double getCreditAvailable() {
    if (limit == null || invoice == null) {
      return 0.0;
    } else {
      return (limit! - invoice!);
    }
  }

  double getLimitPercentUsed() {
    if (invoice != null && limit != null) {
      return (invoice! / limit!);
    }
    return 0.0;
  }

  getOpenFinance() async {
    if (AppShared.actualUser.accounts != null) {
      state.value = HomePageState.LOADED;
      return;
    }

    ResponseInterface? response = await repository.getOpenFinance();
    List<Account> accounts = [];

    if (response.statusCode == 200) {
      for (var element in response.data) {
        List<Transaction> transactions = [];
        for (var transaction in element["transactions"]) {
          transactions.add(Transaction.fromJson(transaction));
        }
        accounts.add(Account.fromJson(element, transactions));
      }

      AppShared.actualUser.accounts = accounts;

      updateCurrentAccount();

      state.value = HomePageState.LOADED;
    }
  }

  String createCreditCardName() {
    List<String> userNames = AppShared.actualUser.name.split(" ");
    String cardName = "";

    for (int i = 0; i < userNames.length; i++) {
      if (i == 0 || i == userNames.length - 1) {
        cardName += userNames[i].toUpperCase();
      } else {
        cardName += userNames[i].characters.first.toUpperCase();
      }
      cardName += " ";
    }

    return cardName.trim();
  }

  String getBankLogo(String bankName) {
    if (bankName == "Banco BRB") {
      return "assets/images/home/minibrlogo.png";
    } else {
      return "assets/images/home/nubank1.png";
    }
  }
}
