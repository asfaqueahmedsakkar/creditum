import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class Model {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? createdBy;
  String? id;
  Map<String, dynamic> json = {};

  Model({
    required this.createdAt,
    required this.updatedAt,
    this.id,
    this.createdBy,
  });

  Model.fromJson(Map<String, dynamic> json) {
    if (json['created_at'] is Timestamp) {
      createdAt = (json['created_at'] as Timestamp).toDate();
    }
    if (json['updated_at'] is Timestamp) {
      updatedAt = (json['updated_at'] as Timestamp).toDate();
    }
    createdBy = json['created_by'];
    id = json['id'];
  }

  @mustCallSuper
  Map<String, dynamic> toJson() {
    if (createdAt != null) json['created_at'] = Timestamp.fromDate(createdAt!);
    if (updatedAt != null) json['updated_at'] = Timestamp.fromDate(updatedAt!);
    json['created_by'] = createdBy;
    return json;
  }
}
