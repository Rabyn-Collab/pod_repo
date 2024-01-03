import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/provider/auth_provider.dart';
import 'package:podsriver/views/auth_page.dart';
import 'package:podsriver/views/home_page.dart';



class StatusPage extends ConsumerWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(userStream);
    return auth.when(
        data: (data){
          if(data == null){
           return AuthPage();
          }else{
            return HomePage();
          }
        },
        error: (err, st) => Center(child: Text('$err')),
        loading: () => Center(child: CircularProgressIndicator())
    );
  }
}