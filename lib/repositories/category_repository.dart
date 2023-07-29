import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sheraa/blocs/exceptions/validation_exception.dart';
import 'package:sheraa/models/categories_model.dart';
import 'package:sheraa/repositories/subcategory_repository.dart';

import 'file_repository.dart';

final GetIt getIt = GetIt.instance;

@Injectable()
class CategoryRepository {
  // final http.Client httpClient;
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('categories');
  final FileRepository fileRepository = getIt<FileRepository>();

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
      List<Map<String, dynamic>> docs =
          await fileRepository.updateLocationToUrls(documents);
      return CategoriesResponse.fromDocument(docs);
    } catch (error) {
      print('Failed to retrieve categories: $error');
    }
    throw Exception("Failed to retrieve categories");
  }

  Future<Category> findByCategoryId(String categoryId) async {
    QuerySnapshot data = await _collection.where('id', isEqualTo: categoryId).get();
    if (data.docs.isEmpty) {
      throw ValidationException("Cannot find category with id $categoryId");
    }
    final updatedData = await fileRepository.updateLocationToUrl(data.docs.first);
    return Category.fromJson(updatedData);
  }
}
