import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:sheraa/models/categories_model.dart';

class CategoryRepository {
  // final http.Client httpClient;
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('categories');

  // CategoryRepository({required this.httpClient});

  // Future<CategoriesResponse> fetchCategories() async {
  //   try {
  //     final response = await httpClient.get('https://example.com/api/categories');
  //     final categories = CategoriesResponse(categories: jsonDecode(response.body));

  //     return categories;
  //   } catch (error) {
  //     throw Exception('Failed to fetch categories: $error');
  //   }
  // }

  Future<CategoriesResponse> getCategoryList() async {
    QuerySnapshot querySnapshot = await _collection.get();
    try {
      List<QueryDocumentSnapshot> documents = querySnapshot.docs;
      return CategoriesResponse.fromDocument(documents);
    } catch (error) {
      print('Failed to retrieve categories: $error');
    }
    throw Exception("Failed to retrieve categories");
  }

  void dispose() {}
}
