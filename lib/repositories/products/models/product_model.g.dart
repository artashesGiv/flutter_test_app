// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      rate: (json['rate'] as num).toDouble(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'category': instance.category,
      'description': instance.description,
      'image': instance.image,
    };

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'category': instance.category,
      'description': instance.description,
      'image': instance.image,
      'rating': instance.rating,
    };
