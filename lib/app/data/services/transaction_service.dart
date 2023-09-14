import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creditum/app/core/values/db_collections.dart';
import 'package:creditum/app/data/models/transaction.dart';

class TransactionService {
  final collection =
      FirebaseFirestore.instance.collection(DBCollections.transaction);
  static final TransactionService _instance = TransactionService._();

  factory TransactionService() => _instance;

  TransactionService._();

  Future<String> getBalance(String userId) async {
    Query query = collection
        .where("created_by", isEqualTo: userId)
        .where("identifier", isEqualTo: '0001');

    QuerySnapshot querySnapshot = await query.get();
    if (querySnapshot.size == 0 || querySnapshot.size > 1) {
      return "0";
    } else {
      int amount = 0;
      for (var element in querySnapshot.docs) {
        amount += int.tryParse(element.get("balance") ?? '0') ?? 0;
      }
      return amount.toString();
    }
  }

  Future<List<TransactionModel>> getTransactions(String userId,
      {DocumentSnapshot? lastDocument}) async {
    Query query = collection.where("created_by", isEqualTo: userId);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    QuerySnapshot querySnapshot = await query.get();
    return querySnapshot.docs
        .map((e) =>
            TransactionModel.fromJson(json: e.data() as Map<String, dynamic>)
              ..snapshot = e
              ..id = e.id)
        .toList();
  }

  Future<TransactionModel> addTransactions(TransactionModel transaction) async {
    DocumentReference documentReference =
        await collection.add(transaction.toJson());
    DocumentSnapshot snapshot = await documentReference.get();
    return TransactionModel.fromJson(
        json: snapshot.data() as Map<String, dynamic>)
      ..snapshot = snapshot
      ..id = snapshot.id;
  }

  Future<TransactionModel> updateTransactions(
      TransactionModel transaction) async {
    DocumentReference documentReference = collection.doc(transaction.id);
    await documentReference.update(transaction.toJson());
    DocumentSnapshot snapshot = await documentReference.get();
    return TransactionModel.fromJson(
        json: snapshot.data() as Map<String, dynamic>)
      ..snapshot = snapshot
      ..id = snapshot.id;
  }
}
