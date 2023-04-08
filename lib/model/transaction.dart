class Transaction {
  final String type;
  final String cpf;
  final String date;
  final double value;
  final String originBank;

  Transaction(this.type, this.cpf, this.date, this.value, this.originBank);

  static getRealValue(double value, bool isCredit) {
    if (isCredit) {
      return value;
    } else {
      return value * -1;
    }
  }

  static String fixCapitalLetters(String type) {
    return "${type[0].toUpperCase()}${type.substring(1).toLowerCase()}";
  }

  factory Transaction.fromJson(Map<String, dynamic> data, String bank) {
    final double value = getRealValue(
        double.parse(data["value"]), data["creditDebitType"] == "CREDITO");
    final String type = fixCapitalLetters(data["type"]);
    return Transaction(type, "032.543.233-11", data["date"], value, bank);
  }
}
