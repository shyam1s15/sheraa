// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subcategory _$SubcategoryFromJson(Map<String, dynamic> json) => Subcategory(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      created:
          const TimestampConverter().fromJson(json['created'] as Timestamp),
      updated:
          const TimestampConverter().fromJson(json['updated'] as Timestamp),
      category: json['category_id'] as String,
    );

Map<String, dynamic> _$SubcategoryToJson(Subcategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'created': const TimestampConverter().toJson(instance.created),
      'updated': const TimestampConverter().toJson(instance.updated),
      'category_id': instance.category,
    };
