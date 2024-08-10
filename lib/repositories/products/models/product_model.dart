import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Rating {
  final double rate;
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
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

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props => [id, title, price, category, description, image];
}

@JsonSerializable()
class ProductDetails extends Product {
  final Rating rating;

  const ProductDetails({
    required super.id,
    required super.title,
    required super.price,
    required super.category,
    required super.description,
    required super.image,
    required this.rating,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductDetailsToJson(this);

  @override
  List<Object?> get props => super.props..add(rating);
}
