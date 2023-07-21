import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shop_app/request/request.dart';

import '../model/goods.dart';

part 'goods.g.dart';

@JsonSerializable()
class GoodsRes {
  int total;
  List<GoodsModel> list;
  GoodsRes(this.list, this.total);
  factory GoodsRes.fromJson(Map<String, dynamic> json) =>
      _$GoodsResFromJson(json);
  Map<String, dynamic> toJson() => _$GoodsResToJson(this);
}

Future<GoodsRes> getGoodsList(
    {String? keyword,
    int page = 1,
    int size = 20,
    int classify = 1,
    int status = 1}) async {
  GoodsRes r = GoodsRes([], 0);
  EasyLoading.show(status: "加载中...");
  try {
    var res = await dio.get("/api/goodsList", queryParameters: {
      "keyword": keyword,
      "page": page,
      "size": size,
      "classify": classify,
      "status": status
    });

    ApiResponse<GoodsRes> result = ApiResponse.fromJson(res.data, (json) {
      return GoodsRes.fromJson(json as Map<String, dynamic>);
    });
    if (result.code == 200) {
      r = result.data!;
      EasyLoading.dismiss();
    } else {
      throw Exception(result.message);
    }
  } catch (e) {
    EasyLoading.dismiss();
    EasyLoading.showError(e.toString());
  }
  return r;
}

Future<GoodsModel?> getGoodsDetail(int id) async {
  EasyLoading.show(status: "加载中，请稍等...", maskType: EasyLoadingMaskType.black);
  GoodsModel? goodsModel;
  try {
    var res = await dio.get("/api/goodsInfo", queryParameters: {"id": id});
    ApiResponse<GoodsModel> result = ApiResponse.fromJson(res.data, (json) {
      return GoodsModel.fromJson(json as Map<String, dynamic>);
    });
    if (result.code == 200) {
      EasyLoading.dismiss();
      goodsModel = result.data!;
    } else {
      throw Exception(result.message);
    }
  } catch (e) {
    EasyLoading.dismiss();
    EasyLoading.showError(e.toString());
  }
  return goodsModel;
}
