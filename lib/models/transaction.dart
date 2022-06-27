class Transaction {
  final String id;
  final String work;
  final double amount;
  final DateTime date;
  Transaction(
      {required this.id,
      required this.work,
      required this.amount,
      required this.date});
}
