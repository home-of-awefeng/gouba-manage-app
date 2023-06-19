import 'package:flutter/material.dart';
import 'package:shop_app/constant/page.dart';
import 'package:shop_app/mvvm/view_model_widget.dart';
import 'package:shop_app/views/resource_management/resource_management_viewmodel.dart';

class ResourceManagementView extends ViewModelWidget<ResourceManagementViewModel> {
  ResourceManagementView({ Key? key }): super(ResourceManagementViewModel(), key: key);

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(RESOURCE_PAGE_NAME),
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
