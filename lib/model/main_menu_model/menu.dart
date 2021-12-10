import 'package:json_annotation/json_annotation.dart';
import 'package:testgorevi/model/main_menu_model/item.dart';

part 'menu.g.dart';

@JsonSerializable(explicitToJson: true)
class Menu {
  Menu({
    required this.name,
    required this.caption,
    required this.image,
    required this.items,
  });

  String name;
  String caption;
  String image;
  List<Item> items;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
