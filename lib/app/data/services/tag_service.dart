import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creditum/app/core/values/db_collections.dart';
import 'package:creditum/app/data/models/tag.dart';

class TagService {
  final collection = FirebaseFirestore.instance.collection(DBCollections.tag);
  static final TagService _instance = TagService._();

  factory TagService() => _instance;

  TagService._();

  Future<List<TagModel>> getTags(String userId,
      {DocumentSnapshot? lastDocument}) async {
    Query query = collection.where("created_by", isEqualTo: userId);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    QuerySnapshot querySnapshot = await query.get();
    return querySnapshot.docs
        .map((e) => TagModel.fromJson(json: e.data() as Map<String, dynamic>)
          ..snapshot = e
          ..id = e.id)
        .toList();
  }

  Future<TagModel> addTag(TagModel transaction) async {
    DocumentReference documentReference =
        await collection.add(transaction.toJson());
    DocumentSnapshot snapshot = await documentReference.get();
    return TagModel.fromJson(json: snapshot.data() as Map<String, dynamic>)
      ..snapshot = snapshot
      ..id = snapshot.id;
  }

  Future<TagModel> updateTag(TagModel transaction) async {
    DocumentReference documentReference = collection.doc(transaction.id);
    await documentReference.update(transaction.toJson());
    DocumentSnapshot snapshot = await documentReference.get();
    return TagModel.fromJson(json: snapshot.data() as Map<String, dynamic>)
      ..snapshot = snapshot
      ..id = snapshot.id;
  }
}
