import 'package:flutter/cupertino.dart';
import 'package:shop_app/model/goods.dart';
import 'package:shop_app/navigation/my_routes.dart';
import 'package:shop_app/request/goods.dart';
import 'package:shop_app/views/goods/goods_classify.dart';
import 'package:shop_app/views/goods/goods_status.dart';

import '../../../mvvm/base_view_model.dart';

class GoodsActionViewModel extends BaseViewModel {
  String pageTitle = MyRoutes.goodsAdd.title;
  String type = "add";
  GoodsModel? goodsModel; // add or edit
  late BuildContext context;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController inventoryController = TextEditingController();
  List<GoodsMedia> medias = [];
  int classify = GoodsClassifies.phone.classify;
  int status = GoodsStatues.offSale.status;
  @override
  Future<void> onViewMount() async {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    if (arguments['type'] == 'edit' && arguments['id'] != null) {
      type = "edit";
      pageTitle = MyRoutes.goodsEdit.title;
      notifyListeners();
      int id = arguments["id"];
      GoodsModel currentGoodsModel = (await getGoodsDetail(id))!;
      goodsModel = currentGoodsModel;
      medias = currentGoodsModel.medias;
      status = currentGoodsModel.status;
      classify = currentGoodsModel.classify;
      titleController.text = currentGoodsModel.title;
      descController.text = currentGoodsModel.desc ?? "";
      tagController.text = currentGoodsModel.tags.join("\n");
      priceController.text = currentGoodsModel.price.toString();
      inventoryController.text = currentGoodsModel.inventory.toString();
      notifyListeners();
    }
  }

  void changeGoodsModelAttr(String key, value) {
    // goodsModel[key] = value;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    tagController.dispose();
  }
}
