import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:podsriver/api_service/auth_service.dart';



final authProvider = AsyncNotifierProvider(() => AuthProvider());
final userStream = StreamProvider((ref) => FirebaseAuth.instance.authStateChanges());

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

  Future<void>userRegister({
    required String email,
    required String password,
    required String username,
    required XFile image
  }) async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => AuthService.userRegister(email: email, password: password, username: username, image: image));
  }


}