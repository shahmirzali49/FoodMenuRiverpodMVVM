// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubMenuItem _$SubMenuItemFromJson(Map<String, dynamic> json) => SubMenuItem(
      name: json['name'] as String,
      image: json['image'] as String,
      price: json['price'].toString(),
    );

Map<String, dynamic> _$SubMenuItemToJson(SubMenuItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
    };
