import 'package:freezed_annotation/freezed_annotation.dart';


part 'product.g.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {

const factory Product({
@JsonKey(name: '_id') required String id,
required String product_name,
required String product_detail,
required int product_price,
required int numReviews,
required String product_image,
required String category,
required int countInStock,
required String brand,
required List<Review> reviews,
}) = _Product;

factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}


@freezed
class Review with _$Review {

  const factory Review({
    required String username,
    required String comment,
    required String user,
    required int rating
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) =>
      _$ReviewFromJson(json);
}
