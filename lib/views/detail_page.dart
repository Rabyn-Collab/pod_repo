import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopy/api.dart';
import 'package:shopy/models/product.dart';
import 'package:shopy/providers/auth/auth_provider.dart';
import 'package:shopy/providers/carts/cart_provider.dart';



class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CachedNetworkImage(
                    errorWidget: (c,s, d){
                      return Image.asset('assets/images/food.png');
                    },
                    imageUrl: '${Api.baseUrl}${product.product_image}',
                    height: 300,
                    fit: BoxFit.cover,),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.product_name),
                        Text(product.product_detail),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Consumer(
              builder: (context, ref, _) {
                final auth = ref.watch(loginAuthProvider);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  child: ElevatedButton(
                      onPressed:  auth.value!.isAdmin ? null:() {
                        ref.read(cartItemsProvider.notifier).addToCart(product);
                      },
                      child: Text('Add To Cart')
                  ),
                );
              }
            )
          ],
        )
    );
  }
}

