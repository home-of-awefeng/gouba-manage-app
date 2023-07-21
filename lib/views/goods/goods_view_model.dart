import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shop_app/model/goods.dart';
import 'package:shop_app/mvvm/base_view_model.dart';
import 'package:shop_app/navigation/my_routes.dart';
import 'package:shop_app/views/goods/goods_classify.dart';
import 'package:shop_app/views/goods/goods_status.dart';

import '../../request/goods.dart';

class GoodsViewModel extends BaseViewModel {
  final List<Tab> _tabs = <Tab>[
    Tab(
        key: Key(GoodsClassifies.phone.classify.toString()),
        text: GoodsClassifies.phone.title),
    Tab(
        key: Key(GoodsClassifies.display.classify.toString()),
        text: GoodsClassifies.display.title),
    Tab(
        key: Key(GoodsClassifies.accessory.classify.toString()),
        text: GoodsClassifies.accessory.title),
    Tab(
        key: Key(GoodsClassifies.other.classify.toString()),
        text: GoodsClassifies.other.title),
  ];

  List<GoodsModel> goodsList = <GoodsModel>[];
  int total = 0;
  int page = 1;
  String keyword = "";
  int status = GoodsStatues.onSale.status;
  final int size = 5;

  late TabController tabController;
  ScrollController scrollController = ScrollController();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  Future<void> onViewInit() async {
    GoodsRes res = await getGoodsList(
        keyword: "",
        page: page,
        size: size,
        classify: GoodsClassifies.phone.classify,
        status: GoodsStatues.onSale.status);
    goodsList = res.list;
    total = res.total;
    notifyListeners();
  }

  // 通过tab index 来获取选择的类目
  int getClassifyByIndex(int index) {
    String keyString = _tabs[index].key.toString();
    return getClassifyByTabKey(keyString);
  }

  // 通过tab key 获取选择的类目
  int getClassifyByTabKey(String keyString) {
    RegExp regex = RegExp(r"\d+"); // 匹配数字
    Iterable<Match> matches = regex.allMatches(keyString);
    int classify = int.parse(
        matches.first.group(0) ?? GoodsClassifies.phone.classify.toString());
    return classify;
  }

  Future<void> onRefreshList() async {
    int classify = getClassifyByIndex(tabController.index);
    try {
      GoodsRes res = await getGoodsList(
        keyword: keyword,
        page: 1,
        size: size,
        classify: classify,
        status: status,
      );
      refreshController.refreshCompleted();
      goodsList = res.list;
      total = res.total;
    } catch (e) {
      EasyLoading.showError("刷新失败");
      refreshController.refreshCompleted();
    }
    notifyListeners();
  }

  Future<void> onLoadMore() async {
    if (goodsList.isNotEmpty && total != 0 && total == goodsList.length) {
      return;
    }
    int classify = getClassifyByIndex(tabController.index);
    try {
      GoodsRes res = await getGoodsList(
        keyword: keyword,
        page: page + 1,
        size: size,
        classify: classify,
        status: status,
      );
      page = page + 1;
      goodsList = [...goodsList, ...res.list];
      total = res.total;
      refreshController.loadComplete();
    } catch (e) {
      EasyLoading.showToast("加载失败");
      refreshController.loadFailed();
    }
    notifyListeners();
  }

  void onFilterChange(String newKeyword, int newStatus) async {
    keyword = newKeyword;
    status = newStatus;
    notifyListeners();
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    int index = tabController.index;
    int classify = getClassifyByIndex(index);
    GoodsRes res = await getGoodsList(
      keyword: newKeyword,
      page: 1,
      size: size,
      classify: classify,
      status: newStatus,
    );
    goodsList = res.list;
    total = res.total;
    notifyListeners();
  }

  void onTabTap(BuildContext context, int index) async {
    tabController.animateTo(index);
    goodsList = [];
    total = 0;
    notifyListeners();
    int classify = getClassifyByIndex(index);
    GoodsRes res = await getGoodsList(
        keyword: keyword,
        page: 1,
        size: size,
        classify: classify,
        status: status);
    goodsList = res.list;
    total = res.total;
    notifyListeners();
  }

  void onAddGoods(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.goodsAdd.path,
        arguments: {"type": "add"});
  }

  void onEditGoods(BuildContext context, GoodsModel goods) {
    Navigator.pushNamed(context, MyRoutes.goodsEdit.path,
        arguments: {"type": "edit", "id": goods.id});
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    tabController.dispose();
    refreshController.dispose();
  }

  List<Tab> get tabs => _tabs;
}
