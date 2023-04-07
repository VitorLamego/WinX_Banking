import 'package:statz_banking/model/account.dart';

class User {
  final String name;
  final String cpf;
  List<Account>? accounts;

  User(this.name, this.cpf, this.accounts);

  factory User.fromLogin(Map<String, dynamic> data) {
    return User(
      data["name"],
      data["cpf"],
      null,
    );
  }
}
