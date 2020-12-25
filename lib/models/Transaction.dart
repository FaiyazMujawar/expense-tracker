class TransactionData {
  final String title;
  final String description;
  final double amount;
  final int timeStamp;

  TransactionData({
    this.timeStamp,
    this.title,
    this.description,
    this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'amount': amount,
      'timeStamp': timeStamp,
    };
  }

  String getString() =>
      "{id: $title, description: $description, amount: $amount, timestamp: ${new DateTime.fromMillisecondsSinceEpoch(timeStamp)}}";
}
