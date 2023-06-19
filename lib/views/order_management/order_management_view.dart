import 'package:flutter/material.dart';
import 'package:shop_app/mvvm/view_model_widget.dart';
import 'package:shop_app/views/order_management/order_management_viewmodel.dart';

class OrderManagementView extends ViewModelWidget<OrderManagementViewModel> {
  OrderManagementView({ Key? key }): super(OrderManagementViewModel(), key: key);

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('OrderManagementView'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '12123',
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}