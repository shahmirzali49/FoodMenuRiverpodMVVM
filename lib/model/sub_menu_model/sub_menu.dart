import 'package:json_annotation/json_annotation.dart';
import 'package:testgorevi/model/sub_menu_model/sub_items.dart';

part 'sub_menu.g.dart';

@JsonSerializable(explicitToJson: true)
class SubMenu {
  SubMenu({
    required this.key,
    required this.description,
    required this.orderTag,
    required this.items,
  });

  String key;
  String description;
  String orderTag;
  List<SubMenuItem> items;

  factory SubMenu.fromJson(Map<String, dynamic> json) => _$SubMenuFromJson(json);

  Map<String, dynamic> toJson() => _$SubMenuToJson(this);
}
