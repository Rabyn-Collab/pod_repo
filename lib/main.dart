import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'views/auth/login_page.dart';




void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String?>('user');



runApp(ProviderScope(child: Home()));
}



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        debugShowCheckedModeBanner: false,
       home: LoginPage(),
    );
  }
}




