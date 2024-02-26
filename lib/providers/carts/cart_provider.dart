import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopy/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/cart_item.dart';

part 'cart_provider.g.dart';



@riverpod
class CartItems extends _$CartItems {
  final box = Hive.box<CartItem>('carts');
  @override
  List<CartItem> build() {
    return box.values.isEmpty ?  []: box.values.toList();
  }

  void addToCart(Product product){
    final newCartItem =  CartItem(
        name: product.product_name,
        product: product.id,
        image: product.product_image ,
        price: product.product_price,
        qty: 1);
     if(state.isEmpty){
       box.add(newCartItem);
       state = [...state, newCartItem];
     }else{
       final isExist = state.firstWhere((element) => element.product == product.id, orElse: (){
         return CartItem(name: 'no-data', product: '', image: '', price: 0, qty:0);
       });
        if(isExist.name == 'no-data'){
          box.add(newCartItem);
          state = [...state, newCartItem];
        }

     }
  }

  int get getTotal{
    int total = 0;
    state.forEach((element) {
      total += element.qty * element.price;
    });
    return total;
  }

  void addSingle(CartItem cartItem){
    cartItem.qty = cartItem.qty + 1;
    cartItem.save();
    state = [
      for(final c in state)  c.product == cartItem.product ? cartItem: c
    ];
  }

  void removeSingle(CartItem cartItem){
    if(cartItem.qty > 1){
      cartItem.qty = cartItem.qty - 1;
      cartItem.save();
      state = [
        for(final c in state)  c.product == cartItem.product ? cartItem: c
      ];
    }

  }

  void removeCart(CartItem cartItem){
     cartItem.delete();
     state.remove(cartItem);
     state = [...state];

  }

  void clearAll(){
    box.clear();
    state = [];
  }

}
