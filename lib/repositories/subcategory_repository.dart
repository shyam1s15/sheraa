import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sheraa/models/sub_category_model.dart';

import 'file_repository.dart';

final GetIt getIt = GetIt.instance;

@singleton
class SubcategoryRepository {
  // final http.Client httpClient;
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('subcategories');
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

  Future<ListSubcategory> getCategoryList() async {
    QuerySnapshot querySnapshot = await _collection.get();
    try {
      List<QueryDocumentSnapshot> documents = querySnapshot.docs;
      List<Map<String, dynamic>> docs =
          await fileRepository.updateLocationToUrls(documents);
      return ListSubcategory.fromDocument(docs);
      // print(docs);
    } catch (error) {
      print('Failed to retrieve categories: $error');
    }
    throw Exception("Failed to retrieve categories");
  }
}
