import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/api_service/auth_service.dart';



final authProvider = AsyncNotifierProvider(() => AuthProvider());

class AuthProvider extends AsyncNotifier{

  @override
  FutureOr build() {
  }

  Future<void> userLogin({
    required String email,
    required String password
  }) async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => AuthService.userLogin(email: email, password: password));
  }
}