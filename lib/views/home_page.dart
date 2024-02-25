import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:podsriver/api.dart';
import 'package:podsriver/providers/auth/auth_provider.dart';
import 'package:podsriver/providers/product/product_provider.dart';
import 'package:podsriver/views/admin/add_form.dart';
import 'package:podsriver/views/admin/crud_page.dart';
import 'package:podsriver/views/detail_page.dart';
import 'package:podsriver/views/user_pages/cart_page.dart';



class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final products = ref.watch(getProductProvider);
    final auth = ref.watch(loginAuthProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Get.to(() => CartPage(), transition:  Transition.leftToRight);
          }, icon: Icon(Icons.shopping_bag))
        ],
      ),
        drawer:  Drawer(
          child: ListView(
            children: [
              if(auth.value?.isAdmin == true)   ListTile(
                onTap: (){
                   Navigator.of(context).pop();
                  Get.to(() => AddForm(), transition: Transition.leftToRight);
                },
                title: Text('Add Product'),
                leading: Icon(Icons.add),
              ),
              if(auth.value?.isAdmin == true)   ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  Get.to(() => CrudPage(), transition: Transition.leftToRight);
                },
                title: Text('Crud Page'),
                leading: Icon(Icons.settings),
              ),
              ListTile(
                onTap: (){
                  ref.read(loginAuthProvider.notifier).userLogOut();
                },
                title: Text('User LogOut'),
                leading: Icon(Icons.exit_to_app),
              ),

            ],
          ),
        ),
        body: products.when(
            data: (data){
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      mainAxisExtent: 200
                    ),
                    itemBuilder:(context, index){
                      final product = data[index];
                      return InkWell(
                        onTap: (){
                        Get.to(() => DetailPage(product: product), transition: Transition.leftToRight);
                        },
                        child: GridTile(
                          footer: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            color: Colors.black54,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text(product.product_name, style: TextStyle(color: Colors.white),)),
                                Text('Rs. ${product.product_price}', style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                            child: CachedNetworkImage(
                              errorWidget: (c,s, d){
                                return Image.asset('assets/images/food.png');
                              },
                              imageUrl: '${Api.baseUrl}${product.product_image}', fit: BoxFit.cover,)
                        ),
                      );
                    }
                ),
              );
            },
            error: (err, st) => Center(child: Text('$err')),
            loading: () => Center(child: CircularProgressIndicator())
        )
    );
  }
}
