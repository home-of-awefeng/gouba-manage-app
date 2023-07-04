import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constant/page.dart';
import 'package:shop_app/mvvm/view_model_widget.dart';
import 'package:shop_app/navigation/my_routes.dart';
import 'package:shop_app/views/home_view_model.dart';
import 'package:shop_app/views/login/login_view.dart';
import 'package:shop_app/state/global.dart';

class HomeView extends ViewModelWidget<HomeViewModel> {
  HomeView({ Key? key }): super(HomeViewModel(), key: key);
  @override
  Widget render(BuildContext context) {
    final globalStateNotifier = Provider.of<GlobalState>(context, listen: true);
    return Consumer<GlobalState>(builder: (context, globalState, _){
      if(!globalStateNotifier.getLoginStatus()){
        return LoginView();
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text(APP_NAME),
        ),
        body: GridView.builder(
            itemCount: viewModel.gridList.length,
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (BuildContext context, int index) {
              MyRoute item = viewModel.gridList[index];
              return Card(
                  child:
                  InkWell(
                    onTap: () => viewModel.onTapGridItem(context, item),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Center(
                        child: Text(item.title),
                      ),
                    ),
                  )
              );
            }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}