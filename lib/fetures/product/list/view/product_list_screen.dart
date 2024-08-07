import 'package:flutter/material.dart';
import 'package:test_project/repositories/products/products.dart';

import '../widgets/product_tile.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key, required this.title});

  final String title;

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  void initState() {
    _loadProducts();
    super.initState();
  }

  List<ProductModel>? _productsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _productsList == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: _productsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final product = _productsList![index];

                return ProductTile(product: product);
              }),
    );
  }

  Future<void> _loadProducts() async {
    _productsList = await ProductsRepository().getProducts();
    setState(() {});
  }
}
