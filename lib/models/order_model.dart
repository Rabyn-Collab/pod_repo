




import 'package:shopy/models/cart_item.dart';

class OrderModel{
  final String id;
  final List<CartItem> carts;
  final int totalAmount;
  final String dateTime;


  OrderModel({
    required this.totalAmount,
    required this.carts,
    required this.id,
    required this.dateTime
});

  factory OrderModel.fromJson(Map<String, dynamic> json){
    return OrderModel(
        totalAmount: json['totalAmount'],
        carts: (json['orderItems'] as List).map((e) => CartItem.fromJson(e)).toList(),
        id: json['_id'],
      dateTime: json['createdAt']
    );
  }


}