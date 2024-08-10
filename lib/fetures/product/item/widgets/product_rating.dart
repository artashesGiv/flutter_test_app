import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/repositories/products/models/models.dart';

class ProductRating extends StatelessWidget {
  final Rating productRating;

  const ProductRating({super.key, required this.productRating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Card(
        elevation: 0,
        color: Colors.grey[200], // Яркая карточка для меньшей цены
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/star.svg',
                    width: 35, // Ширина SVG
                    height: 35, // Высота SVG
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${productRating.rate}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text('${productRating.count} отзыва')
            ],
          ),
        ),
      ),
    );
  }
}
