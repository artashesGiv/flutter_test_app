import 'package:equatable/equatable.dart';

class Rating {
  final double rate;
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}

class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [id, title, price, category, description, image];
}

class ProductItem extends Product {
  final Rating rating;

  const ProductItem({
    required super.id,
    required super.title,
    required super.price,
    required super.category,
    required super.description,
    required super.image,
    required this.rating,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }

  @override
  List<Object?> get props => super.props..add(rating);
}
