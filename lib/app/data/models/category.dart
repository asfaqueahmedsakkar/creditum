import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creditum/app/data/models/model.dart';

class CategoryModel extends Model {
  String? name;
  String? parentId;

  DocumentSnapshot? snapshot;

  CategoryModel(
      {required this.name, this.parentId, String? id, String? createdBy})
      : super(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          id: id,
          createdBy: createdBy,
        );

  CategoryModel.fromJson({required Map<String, dynamic> json})
      : super.fromJson(json) {
    name = json['name'];
    parentId = json['parent_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    json['name'] = name;
    json['parent_id'] = parentId;
    return super.toJson();
  }
}
