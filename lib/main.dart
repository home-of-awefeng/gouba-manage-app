import 'package:flutter/material.dart';
import 'package:shop_app/navigation/routes.dart';
import 'package:shop_app/views/home_view.dart';
import 'package:shop_app/views/order-management/order_management_view.dart';
import 'package:shop_app/views/product-management/product_management_view.dart';
import 'package:shop_app/views/resource-management/resource_management_view.dart';


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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        Routes.productManagement: (context) => const ProductManagementView(title: 'ProductManagementView'),
        Routes.orderManagement: (context) => const OrderManagementView(title: 'OrderManagementView'),
        Routes.resourceManagement: (context) => const ResourceManagementView(title: 'ResourceManagementView'),
        Routes.root: (context) => const HomeView(title: 'Gouba Manage App')
      },
    );
  }
}