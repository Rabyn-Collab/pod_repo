import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




void main (){

runApp(ProviderScope(child: Home()));
}



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        debugShowCheckedModeBanner: false,

    );
  }
}




