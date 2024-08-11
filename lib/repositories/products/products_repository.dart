import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:test_project/repositories/products/products.dart';

class ProductsRepository implements AbstractProductsRepository {
  ProductsRepository(
      {required this.dio,
      required this.productBox,
      required this.productDetailsBox});

  final Dio dio;
  final Box<Product> productBox;
  final Box<ProductDetails> productDetailsBox;

  @override
  Future<List<Product>> getProducts() async {
    try {
      final products = await _fetchProductList();

      final Map<int, Product> productMap = {
        for (var product in products) product.id: product
      };
      productBox.putAll(productMap);

      return products;
    } catch (error, st) {
      GetIt.I<Talker>().handle(error, st);
      return productBox.values.toList();
    }
  }

  @override
  Future<ProductDetails> getProduct(int id) async {
    try {
      final productDetails = await _fetchProductDetails(id);

      productDetailsBox.put(productDetails.id, productDetails);

      return productDetails;
    } catch (error, st) {
      GetIt.I<Talker>().handle(error, st);
      return productDetailsBox.get(id)!;
    }
  }

  Future<List<Product>> _fetchProductList() async {
    final response = await dio.get('https://fakestoreapi.com/products');
    List<dynamic> products = response.data;

    return products.map((item) => Product.fromJson(item)).toList();
  }

  Future<ProductDetails> _fetchProductDetails(int id) async {
    final response = await dio.get('https://fakestoreapi.com/products/$id');
    dynamic data = response.data;

    return ProductDetails.fromJson(data);
  }
}
