import 'package:flutter/material.dart';
import 'package:shop_app/mvvm/base_view_model.dart';

class ProductManagementViewModel extends BaseViewModel {
  final List<Tab> _tabs = <Tab>[
    const Tab(text: 'Zeroth'),
    const Tab(text: 'First'),
    const Tab(text: 'Second'),
  ];


  List<Tab> get tabs => _tabs;
}