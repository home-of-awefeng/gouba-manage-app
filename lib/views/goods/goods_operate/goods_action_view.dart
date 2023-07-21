import 'package:flutter/material.dart';
import 'package:shop_app/mvvm/view_model_widget.dart';
import 'package:shop_app/views/goods/goods_operate/goods_action_view_model.dart';
import 'package:shop_app/views/goods/goods_operate/goods_media_form.dart';
import 'package:shop_app/views/goods/goods_status.dart';

import '../goods_classify.dart';

class GoodsActionView extends ViewModelWidget<GoodsActionViewModel> {
  GoodsActionView({Key? key}) : super(GoodsActionViewModel(), key: key);

  @override
  Widget render(BuildContext context) {
    viewModel.context = context;
    // TODO: implement render
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.pageTitle),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          GoodsMediaForm(
            medias: viewModel.medias,
            onChange: (medias) {
              print("medias, ${medias.length}");
              viewModel.medias = medias;
              viewModel.notifyListeners();
            },
          ),
          TextField(
            controller: viewModel.titleController,
            maxLines: null,
            maxLength: 30,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                hintText: "输入商品标题，30字以内", labelText: "商品标题"),
          ),
          TextField(
            controller: viewModel.descController,
            maxLines: null,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                hintText: "输入商品描述信息，50字以内", labelText: "商品描述"),
          ),
          TextField(
            controller: viewModel.tagController,
            maxLines: null,
            maxLength: 30,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                hintText: "输入商品标签，换行隔开", labelText: "商品标签"),
          ),
          TextField(
            controller: viewModel.priceController,
            maxLines: 1,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(hintText: "输入商品价格", labelText: "商品价格"),
          ),
          TextField(
            controller: viewModel.inventoryController,
            maxLines: 1,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(hintText: "输入商品库存", labelText: "商品库存"),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 10),
              child: const Text("商品分类", style: TextStyle(fontSize: 16)),
            ),
            DropdownButton(
                value: viewModel.classify,
                items: [
                  GoodsClassifies.phone,
                  GoodsClassifies.display,
                  GoodsClassifies.accessory,
                  GoodsClassifies.other
                ].map((g) {
                  return DropdownMenuItem(
                      value: g.classify, child: Text(g.title));
                }).toList(),
                onChanged: (g) {
                  viewModel.classify = g as int;
                  viewModel.notifyListeners();
                }),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 10),
              child: const Text("是否上架", style: TextStyle(fontSize: 16)),
            ),
            DropdownButton(
                value: viewModel.status,
                items: [
                  DropdownMenuItem(
                      value: GoodsStatues.offSale.status,
                      child: const Text("下架")),
                  DropdownMenuItem(
                      value: GoodsStatues.onSale.status,
                      child: const Text("上架"))
                ],
                onChanged: (g) {
                  viewModel.status = g as int;
                  viewModel.notifyListeners();
                }),
          ])
        ]),
      )),
    );
  }
}
