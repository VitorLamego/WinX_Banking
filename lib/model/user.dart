import 'package:statz_banking/model/account.dart';

class User {
  final String name;
  final String cpf;
  final List<Account> accounts;

  User(this.name, this.cpf, this.accounts);
}
