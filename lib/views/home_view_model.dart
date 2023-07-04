import 'package:flutter/material.dart';
import 'package:shop_app/mvvm/base_view_model.dart';
import '../navigation/my_routes.dart';


class HomeViewModel extends BaseViewModel {
  final List<MyRoute> _gridList = [
    MyRoutes.goods,
    MyRoutes.order,
    MyRoutes.swiper,
  ];

  void onTapGridItem(BuildContext context, MyRoute myRoute) {
    Navigator.pushNamed(context, myRoute.path);
  }

  List<MyRoute> get gridList => _gridList;
}