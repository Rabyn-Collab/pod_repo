import 'package:podsriver/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';


@riverpod
class Auth extends _$Auth {
  @override
  FutureOr<void> build() async {

  }

   Future userLogin({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => AuthService.userLogin(email: email, password: password));
  }

}