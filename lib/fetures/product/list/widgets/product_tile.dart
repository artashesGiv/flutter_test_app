import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.productName,
  });

  final String productName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: SvgPicture.asset(
        'assets/images/cat.svg',
        height: 40,
        width: 40,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(productName, style: theme.textTheme.bodyMedium),
      subtitle: Text('some description', style: theme.textTheme.labelSmall),
      onTap: () =>
          {Navigator.of(context).pushNamed('/product', arguments: productName)},
    );
  }
}
