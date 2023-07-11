// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsRes _$GoodsResFromJson(Map<String, dynamic> json) => GoodsRes(
      (json['list'] as List<dynamic>)
          .map((e) => GoodsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
    );

Map<String, dynamic> _$GoodsResToJson(GoodsRes instance) => <String, dynamic>{
      'total': instance.total,
      'list': instance.list,
    };
