import 'package:json_annotation/json_annotation.dart';

part 'grid_list_item.g.dart';

@JsonSerializable(includeIfNull: false)
class GridListItem {
  final String route;
  final String title;

  GridListItem({
    required this.route,
    required this.title,
  });

  factory GridListItem.fromJson(Map<String, dynamic> json) => _$GridListItemFromJson(json);

  Map<String, dynamic> toJson() => _$GridListItemToJson(this);
}
