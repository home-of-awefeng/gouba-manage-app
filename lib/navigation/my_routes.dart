class MyRoutes {
  static MyRoute root = MyRoute("/", "首页");
  static MyRoute goods = MyRoute("/goods", "商品管理");
  static MyRoute goodsEdit = MyRoute("/goods/edit", "商品编辑");
  static MyRoute goodsAdd = MyRoute("/goods/add", "新增商品");
  static MyRoute order = MyRoute("/order", "订单管理");
  static MyRoute swiper = MyRoute("/swiper", "轮播图设置");
  static MyRoute login = MyRoute("/login", "登录");
}

class MyRoute{
  final String path;
  final String title;
  MyRoute(this.path, this.title);
}