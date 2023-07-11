import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_app/request/request.dart';

Future<List<String>> getSwiperUrls() async {
  List<String> urls = [];
  try {
    EasyLoading.show(status: "加载中...");
    var res = await dio.get("/api/swiperList");
    ApiResponse<List<String>> result = ApiResponse.fromJson(res.data, (json) {
      return (json as List).map((e) => e as String).toList();
    });
    if (result.code == 200) {
      urls = result.data ?? [];
    } else {
      throw Exception(result.message);
    }
  } catch (e) {
    urls = [];
    EasyLoading.dismiss();
    EasyLoading.showError(e.toString());
  } finally {
    EasyLoading.dismiss();
  }
  return urls;
}

Future<bool> setSwiperUrls(List<String> urls) async {
  bool ok = false;
  try {
    EasyLoading.show(status: "设置中...");
    var res = await dio.post("/api/updateSwiperList", data: {"imgs": urls});
    EasyLoading.dismiss();
    ApiResponse<dynamic> result =
        ApiResponse.fromJson(res.data, (json) => json);
    if (result.code == 200) {
      ok = true;
      EasyLoading.showToast("设置成功");
    } else {
      throw Exception(result.message);
    }
  } catch (e) {
    EasyLoading.dismiss();
    EasyLoading.showToast("设置失败，联系开发者");
  }
  return ok;
}
