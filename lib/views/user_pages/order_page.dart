import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shopy/api.dart';
import 'package:shopy/models/cart_item.dart';
import 'package:shopy/providers/auth/auth_provider.dart';
import 'package:shopy/providers/order/order_provider.dart';
import 'package:shopy/views/home_page.dart';


class OrderPage extends ConsumerWidget {
  final List<CartItem> carts;
  final int  totalAmount;
  const OrderPage({super.key, required this.carts, required this.totalAmount});

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(orderApiProvider, (previous, next) {

      next.whenOrNull(
          data: (d){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text('successfully order placed')
                )
            );
            Get.offAll(() => HomePage(), transition:  Transition.leftToRight);
          },
          error: (err, st) =>  ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(err.toString())
              )
          )
      );

    });
    final auth = ref.watch(loginAuthProvider).value!;
    final order = ref.watch(orderApiProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Place an Order', style: TextStyle(fontSize: 15),),
      ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shipping Address', style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold),),
               Divider(),
              Text('Address:- ${auth.shippingAddress.address}'),
             Text('City:- ${auth.shippingAddress.city}'),

              Expanded(
                  child: ListView.builder(
                      itemCount: carts.length,
                      itemBuilder: (context, index){
                        final e = carts[index];
                        return ListTile(
                          leading: Container(
                            width: 70,
                            child: CachedNetworkImage(
                                errorWidget: (c,s, d){
                                  return Image.asset('assets/images/food.png', fit: BoxFit.contain,);
                                },
                                imageUrl: '${Api.baseUrl}${e.image}'),
                          ),
                          title: Text(e.name),
                          subtitle: Text('X ${e.qty}'),
                           trailing: Text('Rs.${e.price}'),
                        );
                      }
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Total Amount:- ${totalAmount}'),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){
                      ref.read(orderApiProvider.notifier).addOrder(
                          orderItems: carts,
                          totalAmount: totalAmount,
                          token: auth.token
                      );
                    }, child:  order.isLoading ? Center(child: CircularProgressIndicator()): Text('CheckOut')),
                  ],
                ),
              )

            ],
          ),
        )
    );
  }
}
