import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final double smallerPrice;
  final double largerPrice;

  const ProductPrice({
    super.key,
    required this.smallerPrice,
    required this.largerPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white, // Светло-серый цвет карточки
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
                elevation: 0,
                color: Colors.green, // Яркая карточка для меньшей цены
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$$smallerPrice',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'с бонусной картой',
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(width: 16.0), // Расстояние между карточками
            Expanded(
              child: Card(
                color: Colors.grey[200], // Тусклая карточка для большей цены
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 0,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '\$${double.parse((largerPrice * 1.2).toStringAsFixed(2))}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
