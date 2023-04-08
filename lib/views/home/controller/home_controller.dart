// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:statz_banking/components/card.dart';
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
    } else {
      Account actualAccount =
          AppShared.actualUser.accounts![currentCard.value - 1];
      for (var element in actualAccount.transactions) {
        transactionsHistory.add(
          HistoryCard(
            imagePath: getBankMiniLogo(actualAccount.bankName),
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
          transactions.add(Transaction.fromJson(transaction, element["name"]));
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
      return "assets/images/home/brblogo.png";
    } else {
      return "assets/images/home/nubank1.png";
    }
  }

  String getBankMiniLogo(String bankName) {
    if (bankName == "Banco BRB") {
      return "assets/images/home/minibrlogo.png";
    } else {
      return "assets/images/home/nubank1.png";
    }
  }
    String maskMoney(double value){
     var formatter = NumberFormat('###,###,###.##');
     if (value>1000){
        return formatter.format(value).replaceAll(".", ',').replaceFirst(",", '.');
     }
     else{
      return formatter.format(value).replaceAll(".", ',');
     }
  }

  List<Widget> createCardsScroll(Size size) {
    List<Widget> pageCards = [];

    List<Widget> cardsComponents = [];

    List<Widget> result = [];
    var i = 3;
    for (Account account in AppShared.actualUser.accounts!) {
      cardsComponents.add(
        Center(
          child: CardComponent(
            colors: returnCardsColors(i--),
            name: createCreditCardName(),
            bankImage: getBankLogo(account.bankName),
            bankName: account.bankName,
            cardNumber: account.cardNumber,
          ),
        ),
      );
    }
    double topMargin = 0;
    for (var element in cardsComponents.reversed) {
      pageCards.add(Positioned(top: topMargin, child: element));
      topMargin += 20;
    }

    result.add(SizedBox(
      height: size.height * 0.25,
      width: size.width,
      child: Stack(
        children: pageCards,
      ),
    ));

    result.addAll(cardsComponents);

    return result;
  }

  List<Color> returnCardsColors(int card) {
    if (card % 3 == 0) {
      return [const Color(0XFFA0A2E5), const Color(0XFF3A4396)];
    } else if (card % 3 == 1) {
      return [const Color(0XFFD0C4D3), const Color(0xFFC584DC)];
    }
    return [const Color(0XFFA0A2E5), const Color.fromARGB(255, 163, 210, 77)];
  }
}
