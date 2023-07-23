// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      created:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
      backgroundColor: json['bg_color'] as String,
    )..subcategory = json['subcategory'] == null
        ? null
        : Subcategory.fromJson(json['subcategory'] as Map<String, dynamic>);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'bg_color': instance.backgroundColor,
      'created_at': const TimestampConverter().toJson(instance.created),
      'subcategory': instance.subcategory?.toJson(),
    };
