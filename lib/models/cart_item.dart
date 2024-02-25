import 'package:hive/hive.dart';

part 'cart_item.g.dart';


@HiveType(typeId: 0)
class CartItem extends HiveObject {

  @HiveField(0)
  String name;

  @HiveField(1)
  int qty;

  @HiveField(2)
  String image;

  @HiveField(3)
  int price;

  @HiveField(4)
  String product;



  CartItem({
    required this.name,
    required this.product,
    required this.image,
    required this.price,
    required this.qty
});

  factory CartItem.fromJson(Map<String, dynamic> json){
    return CartItem(
        name: json['name'],
        product: json['product'],
        image: json['image'],
        price: json['price'],
        qty: json['qty']
    );
  }


}

