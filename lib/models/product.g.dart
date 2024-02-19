// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['_id'] as String,
      product_name: json['product_name'] as String,
      product_detail: json['product_detail'] as String,
      product_price: json['product_price'] as int,
      numReviews: json['numReviews'] as int,
      product_image: json['product_image'] as String,
      category: json['category'] as String,
      countInStock: json['countInStock'] as int,
      brand: json['brand'] as String,
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'product_name': instance.product_name,
      'product_detail': instance.product_detail,
      'product_price': instance.product_price,
      'numReviews': instance.numReviews,
      'product_image': instance.product_image,
      'category': instance.category,
      'countInStock': instance.countInStock,
      'brand': instance.brand,
      'reviews': instance.reviews,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      username: json['username'] as String,
      comment: json['comment'] as String,
      user: json['user'] as String,
      rating: json['rating'] as int,
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'comment': instance.comment,
      'user': instance.user,
      'rating': instance.rating,
    };
