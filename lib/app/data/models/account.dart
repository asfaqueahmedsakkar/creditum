import 'package:creditum/app/core/values/enums.dart';
import 'package:creditum/app/data/models/model.dart';

class Account extends Model {
  String? title;
  String? identifier;
  String? balance;
  AccountType? accountType;

  Account(
      {required this.title,
      required this.accountType,
      this.identifier,
      required this.balance,
      String? id,
      String? createdBy})
      : super(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          id: id,
          createdBy: createdBy,
        );

  Account.fromJson({required Map<String, dynamic> json})
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
    return super.toJson();
  }
}
