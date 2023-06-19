import 'package:flutter/material.dart';
import 'package:shop_app/mvvm/base_view_model.dart';
import 'package:shop_app/views/product_management/product_type.dart';

class ProductManagementViewModel extends BaseViewModel {
  final List<Tab> _tabs = <Tab>[
    Tab(key: Key(ProductType.MOBILE.value), text: '手机'),
    Tab(key: Key(ProductType.ACCESSORIES.value), text: '配件'),
    Tab(key: Key(ProductType.OTHERS.value), text: '其他'),
  ];


  List<Tab> get tabs => _tabs;
}