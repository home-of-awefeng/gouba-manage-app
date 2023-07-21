import 'package:json_annotation/json_annotation.dart';

part 'goods.g.dart';

@JsonSerializable()
class GoodsModel {
  List<GoodsMedia> medias;
  List<String> tags;
  String price;
  int inventory;
  String title;
  String? desc;
  int id;
  int classify;
  int status;

  GoodsModel(this.medias, this.tags, this.price, this.inventory, this.title,
      this.desc, this.id, this.classify, this.status);

  factory GoodsModel.fromJson(Map<String, dynamic> json) =>
      _$GoodsModelFromJson(json);
  Map<String, dynamic> toJson() => _$GoodsModelToJson(this);
}

@JsonSerializable()
class GoodsMedia {
  String type;
  String url;
  String fileId;
  GoodsMedia(this.type, this.url, this.fileId);

  factory GoodsMedia.fromJson(Map<String, dynamic> json) =>
      _$GoodsMediaFromJson(json);
  Map<String, dynamic> toJson() => _$GoodsMediaToJson(this);
}
