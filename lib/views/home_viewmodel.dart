import 'package:flutter/material.dart';
import 'package:shop_app/models/grid_list_item.dart';
import 'package:shop_app/mvvm/base_view_model.dart';
import 'package:shop_app/navigation/routes.dart';

class HomeViewModel extends BaseViewModel {
  final List<GridListItem> _gridList = [
    GridListItem(
        route: Routes.productManagement,
        title: '商品管理'
    ),
    GridListItem(
        route: Routes.orderManagement,
        title: '订单管理'
    ),
    GridListItem(
        route: Routes.resourceManagement,
        title: '首页轮播页'
    )
  ];

  void onTapGridItem(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  List<GridListItem> get gridList => _gridList;
}