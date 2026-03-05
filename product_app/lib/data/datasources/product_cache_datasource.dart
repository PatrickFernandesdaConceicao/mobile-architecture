import 'package:product_app/data/models/product_model.dart';

class ProductCacheDatasource {
  List<ProductModel>? _cache;
  void save(List<ProductModel> products) {
    _cache = products;
  }

  List<ProductModel>? get() {
    return _cache;
  }
}

class ProductCacheDatasourceImpl implements ProductCacheDatasource {
  List<ProductModel>? _cachedProducts;

  @override
  Future<void> save(List<ProductModel> products) async {
    _cachedProducts = products;
  }

  @override
  List<ProductModel>? get() {
    return _cachedProducts;
  }

  @override
  List<ProductModel>? _cache;
}
