import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Rating {
  @HiveField(0)
  final double rate;
  @HiveField(1)
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Product extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final String image;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props => [id, title, price, category, description, image];
}

@HiveType(typeId: 3)
@JsonSerializable()
class ProductDetails extends Product {
  @HiveField(6)
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
