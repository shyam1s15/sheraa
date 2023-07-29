
import 'package:json_annotation/json_annotation.dart';
part 'products_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductsDto {
  final String icon;
  final String name;
  final int discount;
  final int price;

  @JsonKey(name: 'category_id')
  final String categoryId;

  @JsonKey(name: 'subcategory_id')
  final String? subCategoryId;

  ProductsDto(this.icon, this.name, this.discount, this.price, this.categoryId, this.subCategoryId);

  factory ProductsDto.fromJson(Map<String, dynamic> json) =>
      _$ProductsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsDtoToJson(this);
}
