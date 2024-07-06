import 'package:flutter/material.dart';

import '../widgets/product_tile.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key, required this.title});

  final String title;

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: const Icon(Icons.arrow_back),
      ),
      body: ListView.separated(
          itemCount: 15,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            String productName = 'Product ${index + 1}';

            return ProductTile(productName: productName);
          }),
    );
  }
}
