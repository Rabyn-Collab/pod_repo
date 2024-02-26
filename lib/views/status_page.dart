import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopy/providers/auth/auth_provider.dart';
import 'package:shopy/views/auth/login_page.dart';
import 'package:shopy/views/home_page.dart';



class StatusPage extends ConsumerWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(loginAuthProvider);
    // print('isLoading: ${auth.isLoading}');
    // print('isReloading: ${auth.isReloading}');
    // print('error: ${auth.error}');
    // print('========================');
   return Scaffold(
     body: auth.when(
       skipLoadingOnReload: true,
         skipError: true,
         data: (data){
           return data.token == 'no-token' ? LoginPage(): HomePage();
         },
         error: (err, st) => Text('$err'),
         loading: () => Center(child: CircularProgressIndicator())),
   );
   // return auth.value?.token == 'no-token' ? LoginPage(): HomePage();
  }
}
