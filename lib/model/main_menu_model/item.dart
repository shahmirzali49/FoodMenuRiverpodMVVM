import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  Item({
    required this.name,
    required this.caption,
    required this.price,
    required this.subMenus,
    required this.image,
  });

  String name;
  String caption;
  dynamic price;
  List<String>? subMenus;
  String image;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
