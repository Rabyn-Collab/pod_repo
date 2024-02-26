import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shopy/api.dart';
import 'package:shopy/providers/product/product_provider.dart';
import 'package:shopy/views/admin/edit_form.dart';


class CrudPage extends ConsumerWidget {
  const CrudPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(getProductProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
      ),
      body: SafeArea(
          child: products.when(
              data: (data){
                return ListView.separated(
                  separatorBuilder: (c, i){
                    return Divider(
                      height: 30,
                    );
                  },
                  itemCount: data.length,
                    itemBuilder: (context, index){
                    final product = data[index];
                     return ListTile(
                       leading: CachedNetworkImage(
                         errorWidget: (c,s, d){
                           return Image.asset('assets/images/food.png');
                         },
                        imageUrl:  '${Api.baseUrl}${product.product_image}', fit: BoxFit.cover, width: 100,),
                       title: Text(product.product_name),
                       trailing: Container(
                         width: 97,
                         child: Row(
                           children: [
                             IconButton(onPressed: (){
                               Get.to(() => EditForm(product), transition: Transition.leftToRight);
                             }, icon: Icon(Icons.edit)),
                             IconButton(onPressed: (){
                               Get.defaultDialog(
                                 title: 'Are You Sure',
                                 content: Text('You Want to remove this post'),
                                 actions: [
                                   TextButton(onPressed: (){
                                     Get.back();
                                   }, child: Text('No')),
                                   TextButton(onPressed: (){
                                     ref.read(productApiProvider.notifier).removeProduct(product.id);
                                   }, child: Text('Yes'))
                                 ]
                               );
                             }, icon: Icon(Icons.delete)),
                           ],
                         ),
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