import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/providers/auth_provider.dart';
import 'package:podsriver/views/auth/login_page.dart';
import 'package:podsriver/views/home_page.dart';



class StatusPage extends ConsumerWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(loginAuthProvider);
    return auth.value?.token == 'no-token' ? LoginPage(): HomePage();
  }
}
