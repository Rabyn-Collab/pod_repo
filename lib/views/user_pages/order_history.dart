import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopy/api.dart';
import 'package:shopy/providers/auth/auth_provider.dart';
import 'package:shopy/providers/order/order_provider.dart';



class OrderHistory extends ConsumerWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(loginAuthProvider);
    final orders = ref.watch(getUserOrdersProvider(token: auth.value!.token));
    return Scaffold(
      appBar:  AppBar(),
        body: SafeArea(
            child: orders.when(
                data: (data){
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index){
                        final order = data[index];
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order Date: ' +order.dateTime.substring(0, 10)),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  children: order.carts.map((e) {
                                    return Row(
                                      children: [
                                        Expanded(child: CachedNetworkImage(
                                          errorWidget: (c,s, d){
                                            return Image.asset('assets/images/food.png');
                                          },
                                          imageUrl: '${Api.baseUrl}${e.image}',
                                          height: 150,
                                          fit: BoxFit.cover)),
                                        SizedBox(width: 20),
                                        Expanded(child: Text(e.name)),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                              Text('Total Amount: ' + '${order.totalAmount}')
                            ],
                          ),
                        );
                      }
                  );
                },
                error: (err, st) => Center(child: Text('$err')),
                loading: () => Center(child: CircularProgressIndicator())
            ))
    );
  }
}
