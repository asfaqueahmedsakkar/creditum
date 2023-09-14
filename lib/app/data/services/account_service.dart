import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creditum/app/core/values/db_collections.dart';
import 'package:creditum/app/data/models/account.dart';

class AccountService {
  final collection =
      FirebaseFirestore.instance.collection(DBCollections.account);
  static final AccountService _instance = AccountService._();

  factory AccountService() => _instance;

  AccountService._();

  Future<List<AccountModel>> getAccounts(String userId,
      {DocumentSnapshot? lastDocument}) async {
    Query query = collection.where("created_by", isEqualTo: userId);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    QuerySnapshot querySnapshot = await query.get();
    return querySnapshot.docs
        .map(
            (e) => AccountModel.fromJson(json: e.data() as Map<String, dynamic>)
              ..snapshot = e
              ..id = e.id)
        .toList();
  }

  Future<AccountModel> addAccount(AccountModel account) async {
    DocumentReference documentReference =
        await collection.add(account.toJson());
    DocumentSnapshot snapshot = await documentReference.get();
    return AccountModel.fromJson(json: snapshot.data() as Map<String, dynamic>)
      ..snapshot = snapshot
      ..id = snapshot.id;
  }

  Future<AccountModel> updateAccount(AccountModel account) async {
    DocumentReference documentReference = collection.doc(account.id);
    await documentReference.update(account.toJson());
    DocumentSnapshot snapshot = await documentReference.get();
    return AccountModel.fromJson(json: snapshot.data() as Map<String, dynamic>)
      ..snapshot = snapshot
      ..id = snapshot.id;
  }
}
