// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsDto _$ProductsDtoFromJson(Map<String, dynamic> json) => ProductsDto(
      json['id'] as String,
      json['icon'] as String,
      json['name'] as String,
      json['discount'] as int,
      json['price'] as int,
      json['category_id'] as String,
      json['subcategory_id'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['about'] as String?,
      json['more_info'] as String?,
    );

Map<String, dynamic> _$ProductsDtoToJson(ProductsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'name': instance.name,
      'discount': instance.discount,
      'price': instance.price,
      'category_id': instance.categoryId,
      'subcategory_id': instance.subCategoryId,
      'images': instance.images,
      'about': instance.about,
      'more_info': instance.moreInfo,
    };
