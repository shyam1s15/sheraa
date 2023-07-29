import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sheraa/dto/products_dto.dart';
import 'package:sheraa/utils/collection_utils.dart';

import 'file_repository.dart';

final GetIt getIt = GetIt.instance;

@Injectable()
class ProductRepository {
  final CollectionReference<Map<String, dynamic>>  _firebaseCollection = FirebaseFirestore.instance.collection("products");
  final FileRepository fileRepository = getIt<FileRepository>();

  Future<List<ProductsDto>?> getProducts(String categoryId, String? subCatId) async {
    Query<Map<String, dynamic>> query = _firebaseCollection;
    query = query.where('category_id', isEqualTo: categoryId);
    if (subCatId != null && subCatId.isNotEmpty && subCatId != "0") {
      query = query.where('subcategory_id', isEqualTo: subCatId);
    }
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await query.get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    List<Map<String, dynamic>> docs =
    await fileRepository.updateLocationToUrls(documents);

    if (CollectionUtil.nonNullNonEmpty(docs)) {
      return docs.map((product) {
        return ProductsDto.fromJson(product);
      }).toList();
    }
  }
}