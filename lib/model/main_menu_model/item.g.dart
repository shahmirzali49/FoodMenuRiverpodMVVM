// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      name: json['name'] as String,
      caption: json['caption'] as String,
      price: json['price'],
      subMenus: ( json['subMenus'] == null ? [] :  json['subMenus'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'name': instance.name,
      'caption': instance.caption,
      'price': instance.price,
      'subMenus': instance.subMenus,
      'image': instance.image,
    };
