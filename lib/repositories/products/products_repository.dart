import 'package:dio/dio.dart';
import 'package:test_project/repositories/models/product_model.dart';

class ProductsRepository {
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await Dio().get('https://fakestoreapi.com/products');
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
