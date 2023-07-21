import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shop_app/mvvm/view_model_widget.dart';
import 'package:shop_app/navigation/my_routes.dart';
import 'package:shop_app/views/goods/goods_item_view.dart';
import 'package:shop_app/views/goods/goods_view_model.dart';

import 'goods_filter_view.dart';

class GoodsView extends ViewModelWidget<GoodsViewModel> {
  GoodsView({Key? key}) : super(GoodsViewModel(), key: key);

  @override
  Widget render(BuildContext context) {
    return DefaultTabController(
      length: viewModel.tabs.length,
      child: Builder(builder: (BuildContext context) {
        viewModel.tabController = DefaultTabController.of(context);
        return Scaffold(
            appBar: AppBar(
              title: Text(MyRoutes.goods.title),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Column(
                  children: [
                    GoodsFilterView(viewModel.onFilterChange),
                    TabBar(
                        tabs: viewModel.tabs,
                        controller: viewModel.tabController,
                        onTap: (int index) {
                          viewModel.onTabTap(context, index);
                        }),
                  ],
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      viewModel.onAddGoods(context);
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
            body: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: const ClassicHeader(
                  refreshingText: "加载中",
                  releaseText: "释放刷新",
                  idleText: "下拉刷新",
                  completeText: "刷新完成",
                ),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget body;
                    if (viewModel.total == viewModel.goodsList.length) {
                      body = const Text("没有更多商品了");
                    } else if (mode == LoadStatus.idle) {
                      body = const Text("上拉加载更多");
                    } else if (mode == LoadStatus.loading) {
                      body = const CupertinoActivityIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = const Text("加载失败，点击重试");
                    } else {
                      body = const Text("没有更多商品了");
                    }
                    return SizedBox(
                      height: 35.0,
                      child: Center(child: body),
                    );
                  },
                ),
                controller: viewModel.refreshController,
                scrollController: viewModel.scrollController,
                onRefresh: viewModel.onRefreshList,
                onLoading: viewModel.onLoadMore,
                child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  itemCount: viewModel.goodsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GoodsItemView(
                        onModify: () {
                          viewModel.onEditGoods(
                              context, viewModel.goodsList[index]);
                        },
                        goodsModel: viewModel.goodsList[index]);
                  },
                )));
      }),
    );
  }
}
