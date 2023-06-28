import 'package:flutter/material.dart';
import 'package:shop_app/common/theme/theme.dart';
import 'package:shop_app/navigation/routes.dart';
import 'package:shop_app/views/home_view.dart';
import 'package:shop_app/views/order_management/order_management_view.dart';
import 'package:shop_app/views/product_management/product/product_create_view.dart';
import 'package:shop_app/views/product_management/product_management_view.dart';
import 'package:shop_app/views/resource_management/resource_management_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gouba Manage App',
      theme: AppTheme.theme,
      routes: {
        Routes.productManagement: (context) => ProductManagementView(),
        Routes.productCreate: (context) => ProductCreateView(),
        Routes.orderManagement: (context) => OrderManagementView(),
        Routes.resourceManagement: (context) => ResourceManagementView(),
        Routes.root: (context) => HomeView()
      },
    );
  }
}