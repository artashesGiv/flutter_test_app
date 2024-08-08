import 'package:test_project/repositories/products/models/product_model.dart';

abstract class AbstractProductsRepository {
  Future<List<Product>> getProducts();

  Future<ProductItem> getProduct(int id);
}
