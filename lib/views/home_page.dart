import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/api.dart';
import 'package:podsriver/providers/auth/auth_provider.dart';
import 'package:podsriver/providers/product/product_provider.dart';



class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final products = ref.watch(getProductProvider);
    return Scaffold(
      appBar: AppBar(),
        drawer:  Drawer(
          child: ListView(
            children: [
              ListTile(
                onTap: (){
                  ref.read(loginAuthProvider.notifier).userLogOut();
                },
                title: Text('User LogOut'),
                leading: Icon(Icons.exit_to_app),
              )
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
                      return GridTile(
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
                          child: Image.network('${Api.baseUrl}${product.product_image}', fit: BoxFit.cover,)
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
