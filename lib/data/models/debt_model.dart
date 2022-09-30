import 'dart:convert';

class DebtModel {
  DebtModel({
    required this.debtor,
    required this.amount,
    required this.date,
    required this.item,
    required this.description,
  });

  final String debtor;
  final double amount;
  final DateTime date;
  final String item;
  final String description;

  factory DebtModel.fromRawJson(String str) => DebtModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DebtModel.fromJson(Map<String, dynamic> json) => DebtModel(
    debtor: json["Debtor"],
    amount: json["amount"].toDouble(),
    date: DateTime.parse(json["date"]),
    item: json["item"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "Debtor": debtor,
    "amount": amount,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "item": item,
    "description": description,
  };
}
