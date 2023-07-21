// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsModel _$GoodsModelFromJson(Map<String, dynamic> json) => GoodsModel(
      (json['medias'] as List<dynamic>)
          .map((e) => GoodsMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      json['price'] as String,
      json['inventory'] as int,
      json['title'] as String,
      json['desc'] as String?,
      json['id'] as int,
      json['classify'] as int,
      json['status'] as int,
    );

Map<String, dynamic> _$GoodsModelToJson(GoodsModel instance) =>
    <String, dynamic>{
      'medias': instance.medias,
      'tags': instance.tags,
      'price': instance.price,
      'inventory': instance.inventory,
      'title': instance.title,
      'desc': instance.desc,
      'id': instance.id,
      'classify': instance.classify,
      'status': instance.status,
    };

GoodsMedia _$GoodsMediaFromJson(Map<String, dynamic> json) => GoodsMedia(
      json['type'] as String,
      json['url'] as String,
      json['fileId'] as String,
    );

Map<String, dynamic> _$GoodsMediaToJson(GoodsMedia instance) =>
    <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
      'fileId': instance.fileId,
    };
