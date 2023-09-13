import 'package:creditum/app/data/models/model.dart';

class Category extends Model {
  String? name;
  String? parentId;

  Category({required this.name, this.parentId, String? id, String? createdBy})
      : super(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          id: id,
          createdBy: createdBy,
        );

  Category.fromJson({required Map<String, dynamic> json})
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
