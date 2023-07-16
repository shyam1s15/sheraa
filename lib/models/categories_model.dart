import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String id;
  final String name;
  final String icon;
  final Timestamp created;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.created
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      created: json['created_at'],
    );
  }
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

  factory CategoriesResponse.fromDocument(List<QueryDocumentSnapshot> docs) {
    final categories = docs
        .map((d) => Category.fromJson(d.data() as Map<String, dynamic>))
        .toList();
    return CategoriesResponse(categories: categories);
  }

}
