class Transaction {
  final String type;
  final String cpf;
  final String date;
  final double value;
  final bool isCreditTransaction;

  Transaction(
      this.type, this.cpf, this.date, this.value, this.isCreditTransaction);

  factory Transaction.fromJson(Map<String, dynamic> data) {
    return Transaction(
      data["type"],
      "032.543.233-11",
      data["date"],
      double.parse(data["value"]),
      data["creditDebitType"] == "CREDITO",
    );
  }
}
