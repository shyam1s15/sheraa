import '../listing_page_request_dto.dart';

class CustomConverter {
  static ListingPageRequestDto convert_cat_subcat_to_dto(String catId,
      String? subCatId) {
    return ListingPageRequestDto(catId, subCatId);
  }
}