
import 'package:json_annotation/json_annotation.dart';
part 'products_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductsDto {
  final String id;
  String icon;
  final String name;
  final int discount;
  final int price;

  @JsonKey(name: 'category_id')
  final String categoryId;

  @JsonKey(name: 'subcategory_id')
  final String? subCategoryId;

  @JsonKey(name: 'images')
  List<String>? images;

  @JsonKey(name: 'about')
  final String? about;

  @JsonKey(name: 'more_info')
  final String? moreInfo;

  ProductsDto(this.id, this.icon, this.name, this.discount, this.price, this.categoryId, this.subCategoryId, this.images, this.about, this.moreInfo);

  factory ProductsDto.fromJson(Map<String, dynamic> json) =>
      _$ProductsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsDtoToJson(this);
}
