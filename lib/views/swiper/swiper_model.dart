import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_app/mvvm/base_view_model.dart';
import 'package:shop_app/request/swiper.dart';

class SwiperModel extends BaseViewModel {
  List<String> swiperUrls = [];
  final urlsController = TextEditingController();
  @override
  Future<void> onViewInit() async {
    swiperUrls = await getSwiperUrls();
    String urlText = swiperUrls.join("\n");
    urlsController.text = urlText;
  }

  void onPressSubmit(BuildContext context) {
    String urlText = urlsController.text;
    if (urlText.trim().isEmpty) {
      EasyLoading.showError("不能为空");
      return;
    }
    List<String> urls = urlText.split("\n");
    setUrls(urls, context);
  }

  void setUrls(List<String> urls, BuildContext context) async {
    bool isSet = await setSwiperUrls(urls);
    if (isSet) {
      Navigator.pop(context);
    }
  }
}
