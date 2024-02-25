import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:podsriver/models/cart_item.dart';
import 'package:podsriver/views/status_page.dart';



void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('bx');
  Hive.registerAdapter(CartItemAdapter());
 final cartBox =  await Hive.openBox<CartItem>('carts');
runApp(
    ProviderScope(
    overrides: [

    ],
    child: Home()));
}








class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
       home: StatusPage(),
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Text('asldkdsa;lkl;'),
        ],
      ),
    );
  }
}



