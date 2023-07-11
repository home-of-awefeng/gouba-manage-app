import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/views/goods/goods_status.dart';

class GoodsFilterView extends StatefulWidget {
  final Function onChange;
  final List<GoodsStatus> list = [
    GoodsStatues.allSale,
    GoodsStatues.onSale,
    GoodsStatues.offSale
  ];

  GoodsFilterView(this.onChange, {super.key});

  @override
  State<GoodsFilterView> createState() {
    return _GoodsFilterViewState();
  }
}

class _GoodsFilterViewState extends State<GoodsFilterView> {
  String keyword = "";
  int status = GoodsStatues.onSale.status; // 默认查已经上架的
  final TextEditingController _searchController = TextEditingController();
  _GoodsFilterViewState();

  @override
  void dispose() {
    _searchController.dispose(); // 释放 TextEditingController 资源
    super.dispose();
  }

  void setKeyword(String newKeyword) {
    setState(() {
      keyword = newKeyword;
    });
  }

  void setStatus(int newStatus) {
    setState(() {
      status = newStatus;
    });
  }

  void onSearch() {
    // _searchController
    FocusScope.of(context).unfocus();
    widget.onChange(keyword, status);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          height: 40,
          width: 80,
          color: Colors.white,
          child: DropdownButton(
              value: status,
              style: const TextStyle(color: Colors.lightBlue),
              elevation: 20,
              onChanged: (Object? status) {
                setStatus(status as int);
              },
              items: widget.list.map((goodStatus) {
                return DropdownMenuItem(
                  value: goodStatus.status,
                  child: Text(goodStatus.title),
                );
              }).toList()),
        ),
        Container(
          height: 40,
          color: Colors.white,
        ),
        Expanded(
          child: Container(
            height: 40,
            color: Colors.white,
            child: CupertinoSearchTextField(
              controller: _searchController,
              prefixIcon: const Icon(null),
              keyboardType: TextInputType.text,
              onChanged: setKeyword,
              backgroundColor: Colors.white,
              placeholder: "关键字查找商品",
            ),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20)),
          child: IconButton.outlined(
            splashRadius: 20,
            onPressed: onSearch,
            icon: const Icon(Icons.search),
            color: Colors.lightBlueAccent,
          ),
        ),
      ],
    );
  }
}
