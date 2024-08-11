import 'package:auto_route/auto_route.dart';

import './router.gr.dart';

// final routes = {
//   '/products': (context) =>
//       const ProductsListScreen(title: 'Flutter Demo Home Page'),
//   '/product': (context) => const ProductScreen()
// };

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ProductsListRoute.page, path: '/'),
        AutoRoute(page: ProductRoute.page)
      ];
}
