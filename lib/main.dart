import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/navigation/my_routes.dart';
import 'package:shop_app/state/global.dart';
import 'package:shop_app/views/goods/goods_operate/goods_action_view.dart';
import 'package:shop_app/views/goods/goods_view.dart';
import 'package:shop_app/views/home_view.dart';
import 'package:shop_app/views/login/login_view.dart';
import 'package:shop_app/views/order_management/order_management_view.dart';
import 'package:shop_app/views/swiper/swiper.dart';

void main() {
  runApp(ChangeNotifierProvider<GlobalState>(
      create: (context) => GlobalState(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '够吧后台管理',
      theme: ThemeData(useMaterial3: true),
      routes: {
        MyRoutes.order.path: (context) => OrderManagementView(),
        MyRoutes.swiper.path: (context) => SwiperView(),
        MyRoutes.login.path: (context) => LoginView(),
        MyRoutes.root.path: (context) => HomeView(),
        MyRoutes.goods.path: (context) => GoodsView(),
        MyRoutes.goodsAdd.path: (context) => GoodsActionView(),
        MyRoutes.goodsEdit.path: (context) => GoodsActionView(),
      },
      builder: EasyLoading.init(),
    );
  }
}
