// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubMenu _$SubMenuFromJson(Map<String, dynamic> json) => SubMenu(
      key: json['key'] as String,
      description: json['description'] as String,
      orderTag: json['orderTag'] as String,
      items: (json['items'] == null ? [] :  json['items'] as List<dynamic>)
          .map((e) => SubMenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubMenuToJson(SubMenu instance) => <String, dynamic>{
      'key': instance.key,
      'description': instance.description,
      'orderTag': instance.orderTag,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
