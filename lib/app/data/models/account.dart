import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creditum/app/core/values/enums.dart';
import 'package:creditum/app/data/models/model.dart';

class AccountModel extends Model {
  String? title;
  String? identifier;
  String? balance;
  AccountType? accountType;

  DocumentSnapshot? snapshot;

  AccountModel(
      {required this.title,
      required this.accountType,
      required this.identifier,
      required this.balance,
      String? id,
      required String? createdBy})
      : super(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          id: id,
          createdBy: createdBy,
        );

  AccountModel.fromJson({required Map<String, dynamic> json})
      : super.fromJson(json) {
    title = json['title'];
    identifier = json['identifier'];
    balance = json['balance'];
    accountType = AccountType.values.byName(json['account_type']);
  }

  @override
  Map<String, dynamic> toJson() {
    json['title'] = title;
    json['identifier'] = identifier;
    json['account_type'] = accountType?.name;
    json['balance'] = balance;
    return super.toJson();
  }
}
