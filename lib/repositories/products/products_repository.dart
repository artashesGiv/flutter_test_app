import 'package:dio/dio.dart';
import 'package:test_project/repositories/products/products.dart';

class ProductsRepository implements AbstractProductsRepository {
  ProductsRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await dio.get('https://fakestoreapi.com/products');

      List<dynamic> data = response.data;
      return data.map((item) => Product.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Не удалось загрузить продукты: $e');
    }
  }

  @override
  Future<ProductItem> getProduct(int id) async {
    try {
      final response = await dio.get('https://fakestoreapi.com/products/$id');
      dynamic data = response.data;

      return ProductItem.fromJson(data);
    } catch (error) {
      throw Exception('Не удалось загрузить продукт: $error');
    }
  }
}
