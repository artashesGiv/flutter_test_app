import 'package:flutter/material.dart';
import 'package:test_project/shared/widgets/expandable_text.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final String description;

  const ProductInfo(
      {required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // Светло-серый цвет карточки
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(title, style: theme.textTheme.titleSmall),
          const SizedBox(height: 15),
          ExpandableText(
            text: 'Описание:\n$description',
            style: theme.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
