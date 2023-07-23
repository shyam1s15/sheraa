import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sheraa/models/categories_model.dart';

part 'sub_category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Subcategory {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'icon')
  String icon;

  @TimestampConverter()
  @JsonKey(name: 'created')
  final DateTime created;

  @TimestampConverter()
  @JsonKey(name: 'updated')
  final DateTime updated;

  @JsonKey(name: 'category_id')
  String category;

  Subcategory(
      {required this.id,
      required this.name,
      required this.icon,
      required this.created,
      required this.updated,
      required this.category});

  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);
  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

class ListSubcategory {
  final List<Subcategory> subcategories;
  ListSubcategory({required this.subcategories});

  factory ListSubcategory.fromJson(Map<String, dynamic> json) {
    final List<dynamic> categoriesJson = json['categories'] ?? [];
    final subcategories = categoriesJson
        .map((categoryJson) => Subcategory.fromJson(categoryJson))
        .toList();
    return ListSubcategory(subcategories: subcategories);
  }

  factory ListSubcategory.fromDocument(List<Map<String, dynamic>> docs) {
    final subcategories = docs.map((d) {
      final s = Subcategory.fromJson(d);
      print(s.toJson());
      return s;
    }).toList();
    return ListSubcategory(subcategories: subcategories);
  }
}
