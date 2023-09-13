import 'package:creditum/app/core/values/enums.dart';
import 'package:creditum/app/data/models/model.dart';

class Transaction extends Model {
  String? title;
  String? identifier;
  String? amount;
  TransactionType? transactionType;
  LoanType? loanType;

  Transaction(
      {required this.title,
      required this.transactionType,
      this.identifier,
      required this.amount,
      String? id,
      String? createdBy})
      : super(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          id: id,
          createdBy: createdBy,
        );

  Transaction.fromJson({required Map<String, dynamic> json})
      : super.fromJson(json) {
    title = json['title'];
    identifier = json['identifier'];
    amount = json['amount'];
    transactionType = TransactionType.values.byName(json['account_type']);
  }

  @override
  Map<String, dynamic> toJson() {
    json['title'] = title;
    json['identifier'] = identifier;
    json['account_type'] = transactionType?.name;
    json['amount'] = amount;
    return super.toJson();
  }
}
