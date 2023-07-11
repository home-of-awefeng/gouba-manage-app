
class GoodsClassifies{
  static GoodsClassify phone = GoodsClassify("手机", 1);
  static GoodsClassify display = GoodsClassify("显示屏", 2);
  static GoodsClassify accessory = GoodsClassify("配件", 3);
  static GoodsClassify other = GoodsClassify("其他", 4);
}


class GoodsClassify{
  final String title;
  final int classify;
  GoodsClassify(this.title, this.classify);
}