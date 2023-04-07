// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:statz_banking/core/app_shared.dart';
import 'package:statz_banking/interfaces/response_interface.dart';
import 'package:statz_banking/model/account.dart';
import 'package:statz_banking/model/transaction.dart';
import 'package:statz_banking/views/home/repository/home_repository.dart';

enum HomePageState { LOADING, LOADED }

class HomeController {
  int currentCard = 0;
  bool balanceVisible = true;

  ValueNotifier<HomePageState> state =
      ValueNotifier<HomePageState>(HomePageState.LOADING);

  HomeRepository repository = HomeRepository();

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
}
