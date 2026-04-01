import 'dart:convert';
import 'package:product_app/data/models/product_model.dart';
import 'package:product_app/core/network/client_http.dart';

class ProductRemoteDatasource {
  final HttpClient client;
  static const _baseUrl = "https://fakestoreapi.com/products";

  ProductRemoteDatasource(this.client);

  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(_baseUrl);
    final List data = jsonDecode(response.body) as List;
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }

  Future<ProductModel> addProduct(ProductModel product) async {
    final response = await client.post(
      _baseUrl,
      body: jsonEncode(product.toJson()),
    );
    return ProductModel.fromJson(jsonDecode(response.body));
  }

  Future<ProductModel> updateProduct(ProductModel product) async {
    final response = await client.put(
      "$_baseUrl/${product.id}",
      body: jsonEncode(product.toJson()),
    );
    return ProductModel.fromJson(jsonDecode(response.body));
  }

  Future<void> deleteProduct(int id) async {
    await client.delete("$_baseUrl/$id");
  }
}