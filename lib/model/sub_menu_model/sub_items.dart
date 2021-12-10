import 'package:json_annotation/json_annotation.dart';
 
part 'sub_items.g.dart';

@JsonSerializable()
class SubMenuItem {
  SubMenuItem({
    required this.name,
    required this.image,
    required this.price,
   });

  String name;
  String image;
  String price;

  factory SubMenuItem.fromJson(Map<String, dynamic> json) => _$SubMenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$SubMenuItemToJson(this);
}
