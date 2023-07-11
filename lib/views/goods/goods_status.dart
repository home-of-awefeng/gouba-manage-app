class GoodsStatues {
  static GoodsStatus onSale = GoodsStatus("上架中", 1);
  static GoodsStatus offSale = GoodsStatus("已下架", 0);
  static GoodsStatus allSale = GoodsStatus("全部", -1);
}

class GoodsStatus {
  final String title;
  final int status;
  GoodsStatus(this.title, this.status);
}
