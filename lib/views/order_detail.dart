import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopy/api.dart';
import 'package:shopy/providers/auth/auth_provider.dart';
import 'package:shopy/providers/order/order_provider.dart';


class OrderDetail extends ConsumerWidget {
  final String id;
  const OrderDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(loginAuthProvider);
    final order = ref.watch(getOrderDetailProvider(token: auth.value!.token, id: id));
    return Scaffold(
      body: SafeArea(
        child: order.when(data: (data){
          return Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Order Details', style: TextStyle(fontSize: 20),),
                ),
                Column(
                  children: data.carts.map((e) {
                    return ListTile(
                      title: Text(e.name),
                      subtitle: Text('Rs.${e.price} X ${e.qty}'),
                      trailing: Container(
                        width: 100,
                        child: CachedNetworkImage(
                            errorWidget: (c,s, d){
                              return Image.asset('assets/images/food.png');
                            },
                            imageUrl: '${Api.baseUrl}${e.image}',
                            fit: BoxFit.cover),
                      ),
                    );
                  }).toList(),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:-'),
                      Text('Rs.${data.totalAmount}')
                    ],
                  ),
                ),

              ],
            ),
          );
        }, error: (err, st) => Center(child: Text('$err')), loading: () => Center(child: CircularProgressIndicator())),
      ),
    );
  }
}