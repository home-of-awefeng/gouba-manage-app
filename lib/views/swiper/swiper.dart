import 'package:flutter/material.dart';
import 'package:shop_app/constant/page.dart';
import 'package:shop_app/mvvm/view_model_widget.dart';
import 'package:shop_app/views/swiper/swiper_model.dart';

class SwiperView extends ViewModelWidget<SwiperModel> {
  SwiperView({ Key? key }): super(SwiperModel(), key: key);

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(SWIPER_PAGE_NAME),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("上传轮播图到后台以后，复制File ID填入下面文本框，多个轮播图换行隔开", style: TextStyle(fontSize: 18)),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: viewModel.urlsController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(hintText: "输入轮播图File ID",  labelText: "轮播图Urls"),
            )
          ),
          Padding(padding: const EdgeInsets.all(6),
            child: FilledButton(onPressed: ()=>{
              viewModel.onPressSubmit(context)
            }, child: const Text("设置"))
          )
        ],
      )
    );
  }
}