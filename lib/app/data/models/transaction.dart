import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creditum/app/core/values/enums.dart';
import 'package:creditum/app/data/models/model.dart';

class TransactionModel extends Model {
  String? title;
  String? amount;
  TransactionType? transactionType;
  LoanType? loanType;
  String? fromAccount;
  String? toAccount;
  String? debitCategory;
  DateTime? transactionDate;
  List<String>? tags;

  DocumentSnapshot? snapshot;

  TransactionModel({
    this.title,
    required this.transactionType,
    required this.amount,
    this.loanType,
    this.fromAccount,
    this.toAccount,
    this.debitCategory,
    required this.transactionDate,
    this.tags,
    String? id,
    String? createdBy,
  }) : super(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          id: id,
          createdBy: createdBy,
        );

  TransactionModel.fromJson({required Map<String, dynamic> json})
      : super.fromJson(json) {
    title = json['title'];
    amount = json['amount'];
    transactionType = TransactionType.values.byName(json['account_type']);
    if (json['loan_type'] != null) {
      loanType = LoanType.values.byName(json['loan_type']);
    }
    fromAccount = json['from_account'];
    toAccount = json['to_account'];
    debitCategory = json['debit_category'];
    transactionDate = (json['transaction_date'] as Timestamp?)?.toDate();
    tags = json['tags'];
  }

  @override
  Map<String, dynamic> toJson() {
    json['title'] = title;
    json['account_type'] = transactionType?.name;
    json['amount'] = amount;
    json['loan_type'] = loanType?.name;
    json['from_account'] = fromAccount;
    json['to_account'] = toAccount;
    json['debit_category'] = debitCategory;
    json['tags'] = tags;
    json['transaction_date'] =
        Timestamp.fromDate(transactionDate ?? DateTime.now());
    return super.toJson();
  }
}
