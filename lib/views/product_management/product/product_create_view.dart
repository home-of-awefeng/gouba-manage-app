import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/common/theme/theme.dart';
import 'package:shop_app/constant/page.dart';
import 'package:shop_app/mvvm/view_model_widget.dart';
import 'package:shop_app/views/product_management/product/product_create_viewmodel.dart';

class ProductCreateView extends ViewModelWidget<ProductCreateViewModel> {

  ProductCreateView({ Key? key }): super(ProductCreateViewModel(), key: key);

  // 弹出底部菜单列表模态对话框
  Future<int?> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            height: 220,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => {},
                    child: Text("选取照片", style: AppTheme.theme.textTheme.T_H6_L),
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Text("选取视频", style: AppTheme.theme.textTheme.T_H6_L),
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Text("拍照", style: AppTheme.theme.textTheme.T_H6_L),
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Text("录像", style: AppTheme.theme.textTheme.T_H6_L),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(PRODUCT_CREATE_PAGE_NAME),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              const Text('图片或视频'),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _showModalBottomSheet(context),
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppTheme.colorTDisable,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Icon(Icons.add, color: AppTheme.colorTGrey, size: 48,),
                      ),
                      // child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              TextField(
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: "标题",
                  hintText: "请输入标题",
                ),
              ),
              TextField(
                maxLength: 10,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                decoration: InputDecoration(
                  labelText: "价格",
                  hintText: "请输入价格",
                ),
              ),
              TextField(
                maxLength: 10,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  labelText: "库存",
                  hintText: "请输入库存",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("保存"),
                        ),
                        onPressed: () => {},
                      )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
