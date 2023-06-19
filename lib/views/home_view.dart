import 'package:flutter/material.dart';
import 'package:shop_app/models/grid_list_item.dart';
import 'package:shop_app/navigation/routes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});
  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<GridListItem> gridList = [
    GridListItem(
        route: Routes.productManagement,
        title: '商品管理'
    ),
    GridListItem(
        route: Routes.orderManagement,
        title: '订单管理'
    ),
    GridListItem(
        route: Routes.resourceManagement,
        title: '首页轮播页'
    )
  ];

  void onTapGridItem(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.builder(
        itemCount: gridList.length,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (BuildContext context, int index) {
          GridListItem item = gridList[index];
          return Card(
              child:
              InkWell(
                onTap: () => onTapGridItem(context, item.route),
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
  }
}