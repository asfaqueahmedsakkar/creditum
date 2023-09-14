import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creditum/app/core/values/db_collections.dart';
import 'package:creditum/app/data/models/category.dart';

class CategoryService {
  final collection =
      FirebaseFirestore.instance.collection(DBCollections.category);
  static final CategoryService _instance = CategoryService._();

  factory CategoryService() => _instance;

  CategoryService._();

  Future<List<CategoryModel>> getCategorys(String userId,
      {DocumentSnapshot? lastDocument}) async {
    Query query = collection.where("created_by", isEqualTo: userId);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    QuerySnapshot querySnapshot = await query.get();
    return querySnapshot.docs
        .map(
            (e) => CategoryModel.fromJson(json: e.data() as Map<String, dynamic>)
              ..snapshot = e
              ..id = e.id)
        .toList();
  }

  Future<CategoryModel> addCategory(CategoryModel transaction) async {
    DocumentReference documentReference =
        await collection.add(transaction.toJson());
    DocumentSnapshot snapshot = await documentReference.get();
    return CategoryModel.fromJson(json: snapshot.data() as Map<String, dynamic>)
      ..snapshot = snapshot
      ..id = snapshot.id;
  }

  Future<CategoryModel> updateCategory(CategoryModel transaction) async {
    DocumentReference documentReference = collection.doc(transaction.id);
    await documentReference.update(transaction.toJson());
    DocumentSnapshot snapshot = await documentReference.get();
    return CategoryModel.fromJson(json: snapshot.data() as Map<String, dynamic>)
      ..snapshot = snapshot
      ..id = snapshot.id;
  }
}
