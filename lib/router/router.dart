import '../fetures/product/product.dart';

final routes = {
  '/products': (context) =>
      const ProductsListScreen(title: 'Flutter Demo Home Page'),
  '/product': (context) => const ProductScreen()
};
