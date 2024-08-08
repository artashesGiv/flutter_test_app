import 'package:flutter/material.dart';
import 'package:test_project/repositories/products/products.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(
        product.image,
        height: 40,
        width: 40,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(
        product.title,
        style: theme.textTheme.headlineMedium,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(product.description,
          style: theme.textTheme.labelSmall, overflow: TextOverflow.ellipsis),
      onTap: () => {
        Navigator.of(context).pushNamed('/product', arguments: product.title)
      },
    );
  }
}
