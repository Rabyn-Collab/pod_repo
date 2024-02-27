import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shopy/api.dart';
import 'package:shopy/providers/auth/auth_provider.dart';
import 'package:shopy/providers/carts/cart_provider.dart';
import 'package:shopy/views/user_pages/order_page.dart';
import 'package:shopy/views/user_pages/shipping_page.dart';


class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(cartItemsProvider);
    final totalAmount = ref.watch(cartItemsProvider.notifier).getTotal;
      final auth = ref.watch(loginAuthProvider);
    return Scaffold(
      appBar: AppBar(),
      body: carts.isEmpty ? Center(child: Text('Add some to cart')): Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: carts.length,
                  itemBuilder: (context, index){
                  final cart = carts[index];
                    return  Row(
                      children: [
                        Expanded(child:  CachedNetworkImage(
                          errorWidget: (c,s, d){
                            return Image.asset('assets/images/food.png');
                          },
                          imageUrl: '${Api.baseUrl}${cart.image}',
                          height: 200,
                          fit: BoxFit.cover,),),
                        Expanded(
                            child: Column(

                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 10),
                             child: Column(
                               children: [
                                 Text(cart.name),
                                 SizedBox(height: 10,),
                                 Text('Rs. ${cart.price}'),
                               ],
                             ),
                           ),

                          Row(
                            children: [
                              OutlinedButton(
                                  onPressed: (){
                                    ref.read(cartItemsProvider.notifier).addSingle(cart);
                                  }, child: Icon(Icons.add)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text('${cart.qty}'),
                              ),
                              OutlinedButton(
                                  onPressed: (){
                                    ref.read(cartItemsProvider.notifier).removeSingle(cart);
                                  }, child: Icon(Icons.remove))
                            ],
                          )
                        ],)
                        ),

                      ],
                    );
                  }
              )
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Amount:-'),
                    Text('Rs.${totalAmount}'),
                  ],
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                    if(auth.value!.shippingAddress.isEmpty){
                      Get.to(() => ShippingPage(), transition: Transition.leftToRight);
                    }else{
                      Get.to(() => OrderPage(), transition: Transition.leftToRight);
                    }
                }, child: Text('OrderPlace')),
              ],
            ),
          )

        ],
      ),
    );
  }
}