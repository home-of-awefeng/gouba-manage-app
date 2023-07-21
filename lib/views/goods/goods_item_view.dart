import 'package:flutter/material.dart';
import 'package:shop_app/model/goods.dart';

class GoodsItemView extends StatelessWidget {
  final Function onModify;
  GoodsModel goodsModel;
  GoodsItemView({super.key, required this.goodsModel, required this.onModify});

  Widget getImageOrVideo(GoodsModel goods) {
    GoodsMedia media = goods.medias.first;
    late Widget result;
    if (media.type == 'video') {
      result = Image.network(media.url, fit: BoxFit.cover);
    } else {
      result = Image.network(media.url, fit: BoxFit.cover);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      // background:
      child: Flex(direction: Axis.horizontal, children: [
        SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: getImageOrVideo(goodsModel)),
        ),
        Expanded(
          child: Column(
            children: [
              ListTile(title: Text(goodsModel.title)),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: const Text("下架"),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        child: const Text("修改"),
                        onPressed: () {
                          onModify();
                        }),
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
