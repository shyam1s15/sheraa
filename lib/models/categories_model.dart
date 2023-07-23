import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  @JsonKey(name: 'id')
  String id;
  
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'icon')
  String icon;

  @TimestampConverter()
  @JsonKey(name: 'created_at')
  final DateTime created;
  
  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.created
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

class CategoriesResponse {
  final List<Category> categories;

  CategoriesResponse({required this.categories});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> categoriesJson = json['categories'] ?? [];
    final categories = categoriesJson
        .map((categoryJson) => Category.fromJson(categoryJson))
        .toList();
    return CategoriesResponse(categories: categories);
  }

  factory CategoriesResponse.fromDocument(List<Map<String, dynamic>> docs) {
    final categories = docs
        .map((d) => Category.fromJson(d))
        .toList();
    return CategoriesResponse(categories: categories);
  }

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
