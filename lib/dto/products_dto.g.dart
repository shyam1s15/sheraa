// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsDto _$ProductsDtoFromJson(Map<String, dynamic> json) => ProductsDto(
      json['icon'] as String,
      json['name'] as String,
      json['discount'] as int,
      json['price'] as int,
      json['category_id'] as String,
      json['subcategory_id'] as String?,
    );

Map<String, dynamic> _$ProductsDtoToJson(ProductsDto instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'name': instance.name,
      'discount': instance.discount,
      'price': instance.price,
      'category_id': instance.categoryId,
      'subcategory_id': instance.subCategoryId,
    };
