import 'package:dio/dio.dart';
import 'package:test_project/repositories/products/products.dart';

class ProductsRepository implements AbstractProductsRepository {
  ProductsRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        throw Exception('Не удалось загрузить продукты');
      }
    } catch (e) {
      throw Exception('Не удалось загрузить продукты: $e');
    }
  }
}
