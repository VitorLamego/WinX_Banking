class Transaction {
  final String type;
  final String cpf;
  final String date;
  final double value;

  Transaction(this.type, this.cpf, this.date, this.value);

  static getRealValue(double value, bool isCredit) {
    if (isCredit) {
      return value;
    } else {
      return value * -1;
    }
  }

  factory Transaction.fromJson(Map<String, dynamic> data) {
    final double value = getRealValue(
        double.parse(data["value"]), data["creditDebitType"] == "CREDITO");
    return Transaction(data["type"], "032.543.233-11", data["date"], value);
  }
}
