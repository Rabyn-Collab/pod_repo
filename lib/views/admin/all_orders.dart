import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shopy/api.dart';
import 'package:shopy/providers/auth/auth_provider.dart';
import 'package:shopy/providers/order/order_provider.dart';
import 'package:shopy/views/order_detail.dart';


class AllOrderPage extends ConsumerWidget {
  const AllOrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(loginAuthProvider);
    final orders = ref.watch(getAllOrdersProvider(token: auth.value!.token));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
      ),
      body: SafeArea(
          child: orders.when(
              data: (data){
                return ListView.separated(
                    separatorBuilder: (c, i){
                      return Divider(
                        height: 30,
                      );
                    },
                    itemCount: data.length,
                    itemBuilder: (context, index){
                      final order = data[index];
                      return Card(
                        child: ListTile(
                          onTap: (){
                          Get.to(() => OrderDetail(id:order.id), transition: Transition.leftToRight);
                          },
                          title: Text(order.id),
                            subtitle: Text(order.dateTime),
                          trailing:  Icon(Icons.arrow_forward_ios_rounded)
                        ),
                      );
                    }
                );
              },
              error: (err, st) => Center(child: Text('$err')),
              loading: () => Center(child: CircularProgressIndicator())
          )),
    );
  }
}