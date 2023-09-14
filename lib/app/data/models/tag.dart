import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creditum/app/data/models/model.dart';

class TagModel extends Model {
  String? name;

  DocumentSnapshot? snapshot;

  TagModel({
    required this.name,
    String? id,
    String? createdBy,
  }) : super(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          id: id,
          createdBy: createdBy,
        );

  TagModel.fromJson({required Map<String, dynamic> json})
      : super.fromJson(json) {
    name = json['name'];
  }

  @override
  Map<String, dynamic> toJson() {
    json['name'] = name;
    return super.toJson();
  }
}
