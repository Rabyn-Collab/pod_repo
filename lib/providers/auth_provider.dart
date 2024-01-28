import 'package:podsriver/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';


@riverpod
class LoginAuth extends _$LoginAuth {
  @override
  FutureOr<void> build() async {

  }

   Future userLogin({required Map data}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => AuthService.userLogin(data: data));
  }

}

@riverpod
class SignUpAuth extends _$SignUpAuth {
  @override
  FutureOr<void> build() async {

  }

  Future userSignUp({required Map data}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => AuthService.userSignUp(data: data));
  }

}