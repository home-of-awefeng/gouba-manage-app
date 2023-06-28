import 'package:flutter/material.dart';
import 'package:shop_app/constant/page.dart';
import 'package:shop_app/mvvm/view_model_widget.dart';
import 'package:shop_app/views/product_management/product_list_view.dart';
import 'package:shop_app/views/product_management/product_management_viewmodel.dart';

class ProductManagementView extends ViewModelWidget<ProductManagementViewModel> {
  ProductManagementView({ Key? key }): super(ProductManagementViewModel(), key: key);

  @override
  Widget render(BuildContext context) {
    return DefaultTabController(
      length: viewModel.tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: const Text(PRODUCT_PAGE_NAME),
            bottom: TabBar(tabs: viewModel.tabs,),
          ),
          body: TabBarView(
            children: viewModel.tabs.map((Tab tab) {
              return ProductListView(key: tab.key);
            }).toList(),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => viewModel.onTapFloatingButton(context),
            label: const Text('上架'),
            icon: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
