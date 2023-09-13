import 'package:creditum/app/data/models/model.dart';

class Tag extends Model {
  String? name;

  Tag({
    required this.name,
    String? id,
    String? createdBy,
  }) : super(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          id: id,
          createdBy: createdBy,
        );

  Tag.fromJson({required Map<String, dynamic> json}) : super.fromJson(json) {
    name = json['name'];
  }

  @override
  Map<String, dynamic> toJson() {
    json['name'] = name;
    return super.toJson();
  }
}
