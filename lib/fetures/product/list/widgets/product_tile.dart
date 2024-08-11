import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_project/repositories/products/products.dart';
import 'package:test_project/router/router.gr.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

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
          style: theme.textTheme.labelMedium, overflow: TextOverflow.ellipsis),
      onTap: () => {
        AutoRouter.of(context).push(
            ProductRoute(productName: product.title, productId: product.id))
      },
    );
  }
}
