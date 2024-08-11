// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:test_project/fetures/product/item/view/product_screen.dart'
    as _i1;
import 'package:test_project/fetures/product/list/view/product_list_screen.dart'
    as _i2;

/// generated route for
/// [_i1.ProductScreen]
class ProductRoute extends _i3.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i4.Key? key,
    required String productName,
    required int productId,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            productName: productName,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductRouteArgs>();
      return _i1.ProductScreen(
        key: args.key,
        productName: args.productName,
        productId: args.productId,
      );
    },
  );
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.productName,
    required this.productId,
  });

  final _i4.Key? key;

  final String productName;

  final int productId;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, productName: $productName, productId: $productId}';
  }
}

/// generated route for
/// [_i2.ProductsListScreen]
class ProductsListRoute extends _i3.PageRouteInfo<void> {
  const ProductsListRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ProductsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.ProductsListScreen();
    },
  );
}
