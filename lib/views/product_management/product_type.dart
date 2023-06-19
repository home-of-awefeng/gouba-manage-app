enum ProductType {
  MOBILE,
  ACCESSORIES,
  OTHERS,
}

extension ProductTypeValue on ProductType {
  String get value => toString().split('.').last.toUpperCase();
}